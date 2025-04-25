Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4275293njd;
        Fri, 25 Apr 2025 03:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVar7dUnVkJphHvC5/olPLcsWU3rVOL3ZMsW9Qy8N0kLtXrKYu87lIkYtro5+EQcz6xUhB8VLfJTKbCHA==@linaro.org
X-Google-Smtp-Source: AGHT+IHQdNuaKLUqKKtReGnaTydkX8qUi3sONZtWCGb5y+udd0hSXRvcqsqIbeWSOXbSZJ4OLlaR
X-Received: by 2002:a05:620a:394e:b0:7c7:a6c1:71bc with SMTP id af79cd13be357-7c960785e1amr305098285a.43.1745577661038;
        Fri, 25 Apr 2025 03:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745577661; cv=none;
        d=google.com; s=arc-20240605;
        b=kd7ttVVbcjpTpgsqZCKK2L7JtHJnvehuVZFw3IwQ+QczyUUL8HoqrLfpwcA43DO9s0
         pxn/31AY5F6jcYsozYBn5okcBjh0UNz1CQMSZV+jivWcpeA8+wWULvPo4GWJAg2mSgY7
         KtZ7Wk1RhsKKS4TDr+/NV2IF/cvvURbxa0Tua2LBzkNzp8Tvhvn68ofxBRrt060MKaEN
         C3mSJDhJaYuDY394959eH4nkLdpStRyn9BHoppuUHRbebELd93DL2hnqmHvHp/JIU6tr
         BSBrqVgcp86dgekAM9asNs2wuJ5/2/j8wDc/5BAjhftUy/ziOopNvhr8vISQOvbd2niI
         3dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=h4LcOLggjilTTo1NDNreIIcEQrd2fJd9yxzKVgZ2BUk=;
        fh=zsFiT7XAgmqrrteuXApArddHr3V4I25cktBRDdsdV2I=;
        b=foGfv86GlsB6ZtruCdBI3w0FGFsHbDxp2bQ6jPOWWybkfCWwYjTVcvPKlX4Bcg2TMe
         F8JnzT/wBvwTnDw9Xoo4S1g21Wsyo1YjEsnuDu+khdp/B8ebvpqqw7Mumg/pzntMYkUF
         FabUTOOwpJ6YlvmeOiVGIY9NrpwoGDwY2+uM4V9s2i2mAndeMkaU0f0Wgn0+2SOP6e73
         xbI846ZUlQlqRrlpZ560V+qBs8B0F46ZNXqsKPGflWZOgs2P0a2QicHczPTIl9kFB5xG
         QhpG5DLVIY/IZTNWErolty0ZLXXQGDeGoNBottDAPzHOEuTsLxrmKeG1vIlqSIk46Zln
         bDtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H0BmooJT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958c9f027si351398685a.38.2025.04.25.03.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 03:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H0BmooJT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8GU8-0002yg-9A; Fri, 25 Apr 2025 06:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GU2-0002xg-PY
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:40:39 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GU1-0000FG-9h
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:40:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so10897415e9.2
 for <qemu-arm@nongnu.org>; Fri, 25 Apr 2025 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745577634; x=1746182434; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h4LcOLggjilTTo1NDNreIIcEQrd2fJd9yxzKVgZ2BUk=;
 b=H0BmooJTQZsRSn8JORvT13K7qO4XmDzjQAVjcVPahw3XU5A+eljdU+Qq/yJ5/FNajh
 ryJMPzjelz05GOkkOZ6Hca51GdUEhbwm4kUioo700mqctarwWZOn/Qn6wJtKoHQEQnrS
 YQyuHKu4lADcOZP7I1Anwh/dtjEdY94HQ4g343OqnMu9xSlC/HJbzcTz1ShsOXIQPhIE
 j340OFWJQubUtgYWTlYA8Tkp7StZfwEUtXzAHT+6AtVJ3HzLfbUyzQ9VbY6tycA7J785
 AGmjojvmmVKsScs3tgqKGA36F2AVzSIgS4dy9HydygrqDwS4Nt6KU1vi1HcP494i81wH
 Katg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745577634; x=1746182434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h4LcOLggjilTTo1NDNreIIcEQrd2fJd9yxzKVgZ2BUk=;
 b=axlsYpaMrdYQlhiyb1Q6pMyKCc8NzWm8XuXMjuTV4zUYhBE8lz9mRu7Ga0JZAZZyBD
 AnFXXl9At8v4yDhg+Zn/Qtkipj9MvmZr1WDYq0goVmGZ/0gXBOGbj2iFePES8u+j7Df3
 OxPbflOm8AaIrzM36xYvCE3Q3NStNJAduxrGijMFMGxsetGnzLmf+4L9212Oq8OkxImT
 4/tKbz7xgkjF5dh/BTJsFzrhd0Scd2uEQZ3FEQyO+fohWG5TJAdb6mkgfaZgci29ELSn
 NYQO5vqaQPa9H8c8gS1cBgogwop3GPYNuoHiZd+HBfIRvH3DMYXr3bQzzh8vChb/mlio
 K4rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaZ3nBgmiJ2e+2fOL0RO2vejOqw24zTHMU0spg4LhTef0j9E/g8TDAGDrL5NRAbve/MrUhsYwogg==@nongnu.org
X-Gm-Message-State: AOJu0YxB1JmBrMuS4nuqwf9NjKu1dfNZ+5nZfzM6SItDxwxNFkfhI5Tm
 L9lEEoTrUPSuSRv7ji2P/S41vfpJOXKwWZIigZo3HVjpOZHKWyGlSjwgUSdZZTI=
X-Gm-Gg: ASbGncs2nr6gL3o9Ks/O1Y5Ghf/hnrGvhmMQ/sk4S/g2mngKg/VesPKy92wy9OY4zzM
 GdhzMktdIgF46rz6r71TgOQfO8qJ16lgIHc+5ARlSoQ5EGNeqbMoCPD6YGzdCTIQHoQ9sVCV6ij
 Wqg2QNEVS6ciSyWnj9vIW04yOd/TBqOcXV9bOz5Y2YWvju3in/04saAAM2Z6BzrkuSG/H9War2D
 teVUW3Eqhb3n9K2jHv3YNPRnz3L0brZdl1NV8ZnGZbln3zvaRIyUEhPy7VNKGA6MNyJk1GRQF9T
 5Th77xhEC2Iv63d72BD/Px7atnLoO0GfQ+lRKR4R1c5yoSPM1hXdSmB1WDur+ds6xqp5T99yTKQ
 zCJ9C/68HU8ohbhaqQmo=
X-Received: by 2002:a05:600c:3b23:b0:43c:e2dd:98ea with SMTP id
 5b1f17b1804b1-440a66abcbemr13288875e9.22.1745577633654; 
 Fri, 25 Apr 2025 03:40:33 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e00d8sm51835125e9.35.2025.04.25.03.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 03:40:33 -0700 (PDT)
Message-ID: <6f16193c-8acf-4857-b08f-e8a5d8ca3945@linaro.org>
Date: Fri, 25 Apr 2025 12:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 4/9] target/arm: Handle gdb_core_xml_file in
 TYPE_ARM_CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9/NYRufl5P4q

On 17/3/25 15:28, Peter Maydell wrote:
> Instead of having the TYPE_AARCH64_CPU subclass set
> CPUClass:gdb_core_xml_file to a different value from that that
> TYPE_ARM_CPU uses, implement the gdb_get_core_xml_file method in the
> TYPE_ARM_CPU class to return either the AArch64 or AArch32 XML file
> name.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c         | 16 +++++++++++++++-
>   target/arm/cpu64.c       |  1 -
>   target/arm/tcg/cpu-v7m.c |  1 -
>   3 files changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

