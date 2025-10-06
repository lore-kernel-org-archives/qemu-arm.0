Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BDDCCA471
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 13:16:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5l40-0000OX-0b; Mon, 06 Oct 2025 09:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5l3x-0000O8-FF
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 09:15:37 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5l3r-0003Ap-En
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 09:15:35 -0400
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso2544850f8f.0
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759756525; x=1760361325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vmPIqWj2Wtv4C49NaQG7FA68ceHxLlp3TZb7QBj4Rw4=;
 b=keh/+VzodiX+5OeHe47ttKl0M6TjKmDXO1dB95JmoM9N/jaqne6h4RIIuBXURHzfoS
 /9Sum/JpGkqIybFhAHifj5FJbXNW0NpvOLvkOlIolA55yLxCJDNdulIo33EkpcPOzmTj
 5nfcnKQ9aITrxpehQ0bcvozMmUb1ntvJWEdq+2Ysuy7nxnNK/MRnPLgBXQdTKzLDt+gt
 pqQM1BckerV9ATxBFxeol6JJTWlm5CAL+VW6bkZ/9rP5auiZ3suqmIU9BRNUdqz+aw1t
 cCnTp1VGpcn/Rx8iA1K8i6W9jo7r3UCHsG6apW+YzfKkWlJKI/JVkFk4FCBwCt7rQtiU
 G25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759756525; x=1760361325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmPIqWj2Wtv4C49NaQG7FA68ceHxLlp3TZb7QBj4Rw4=;
 b=Wcb+efF3A5WVBbz4eZKIjZFXIDBeVG3zvRZBzbMyYWAK4ZlQTrZXjEn3Scqf0PzZ+k
 i5CVk7PCPJMv+5dCV/SXT1+fpZbHN+4vpM4KD717U7kBoQuK7WrxDaSmWV8bqHBFrxov
 D+Aqvapjo4XOUDRQURoHTYs6cZBvL3q30lY72I3JZHDUNdYqcqdk3dALP9kj4C/Q6SGF
 +XWWV7eSyRbREwqoiqfjZ85aNLoJ+GTDRlLCDkRVyDb6aMoEQt9eV9Q6i7OzPsZhh2Gk
 VIdgH8q4iZNqteXWRapcUuLOfhZN9/jNVO3LKCNCsDFk/jQxtjp/jZrQrLDDQOef7vzJ
 mZ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW74QhVbtgas3eCB/k1NCEYjfeDt8yWVaHGtxkR6Wt1lZAYgfLXJ++9h/oAoZhF7fMTkSnIB7JAUw==@nongnu.org
X-Gm-Message-State: AOJu0YwzwtLqSubT8DNWcIzTGRFiJMU9wPcFWvTOWCWVarq5nD9ofMZ4
 rVQjSneEucghVgk9QQgzy4TVqCBYdWpR5m3I0i85iWdTsFFzxI1nGZL8c1CpDLuA6LQ=
X-Gm-Gg: ASbGnctmmJBK5CqC9QTIfI29U8KcXD1TAymIaBWEDjkOEZ14oSQRntzZb5VQeuT/Ya0
 zs5dRSd4b/VewWehntt4y4E+yDvKR6VP5eBMP2jRNyUesqjC5Ap6B4gVctgVOzwZY+9yp9B8Dvs
 cKXKs+eplAJ1IKtySPLSlkuNsgqqTeqUwDd9kvs3zgu7uw73ltWCMZz1HkzpNZUdr+3DQeOHos1
 Va8AhqeOnKr9TObdiy0eomrHOI9gsOyZseT+yD7UY6jiI8L2ukJ4wCvH19zIn7VZjZ5KdFzH0mn
 eR9Qb/HZt6zxuyCr5QWiKaRIuuMwvsBWyLlIhkzdoZDZPz67DjTa9FZccQC/jjS7XF7Z9mvPklg
 R3YNJF2Zw/ZvwiAQqc5dZur7Do9ZOkbf0Dd6fssjA+jIbYbn5BNpoJiE5Wu851N/3lCtl4gwlkS
 iJAoNvixrRzpS3cnpZEA==
X-Google-Smtp-Source: AGHT+IFz0V58JhRk1kKFVZcpt2UYfO2wIR49iXxqvauzKK1Qs17TiMZ5+X3XsCxL2xtz9u8Fm+Vofg==
X-Received: by 2002:a05:6000:4285:b0:3e5:5822:ec9d with SMTP id
 ffacd0b85a97d-4256719ea15mr6449385f8f.41.1759756524605; 
 Mon, 06 Oct 2025 06:15:24 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9724sm20626061f8f.28.2025.10.06.06.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 06:15:24 -0700 (PDT)
Message-ID: <d346ac0c-5d9e-46ab-bcb0-c425741a6814@linaro.org>
Date: Mon, 6 Oct 2025 15:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/aarch64: Skip some sbsaref_alpile tests
 by default
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Radoslaw Biernacki <rad@semihalf.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20251006115022.164004-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251006115022.164004-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/10/25 13:50, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> test_sbsaref_alpine is one of the longest running tests in our testsuite,
> because it does a full Linux boot a couple of times, for various different
> CPU configurations. That's quite a lot of testing each time, for a rather
> small additional test coverage, so mark some of the tests with the
> @skipSlowTest() decorator.
> 
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   See: https://lore.kernel.org/qemu-devel/87eczriaej.fsf@draig.linaro.org
>   
>   tests/functional/aarch64/test_sbsaref_alpine.py | 2 ++
>   1 file changed, 2 insertions(+)

'alpile' typo in subject.


