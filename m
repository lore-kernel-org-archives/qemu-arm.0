Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C97CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:08:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyzY-0007yx-EI; Mon, 20 Oct 2025 19:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyzV-0007ux-Cb
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:08:37 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyzT-0006Nw-Rg
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:08:37 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b5a631b9c82so3209739a12.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761001714; x=1761606514; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fzBkV2fCoTAffj+UIbjcI0BpHVKodb0lg/6/u09lDrg=;
 b=d18jdQ8gy43s9efi5PlrozR5i7X22FH7+hvFANXjWWyN3/Xs85lD04P4DOSm1VMU5C
 KTRacb8AnUlKXiX29XCL9o0MSplGVF6eUR/zj99JFMXRWuyOxEYel0qjzzCKT/RabgzE
 ZS/3jVLsUYub4Az1WehKLkpYcQLzRHL3OL3kwa+Jd4+e3/2XBHxBf/m+/2irjWbQtujc
 YmgHKxec4tXz2TsY43vjCG5MVC7UUV8Dyz5PpYgZWX/ezgQECeZxzGjtOLmbMEu7HcXu
 loc377S0+ppLXGhY98IkjHH0fHfIlK9Ocv8Sc0z5SeUVZ826y4OklAGoToMvChdNQMxX
 ocKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001714; x=1761606514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fzBkV2fCoTAffj+UIbjcI0BpHVKodb0lg/6/u09lDrg=;
 b=APzLwxLflu0aVAgmbkLFTNwEQwNeqxHhDKENALC//CYot5lbMNa32jr2WNWzkSl3im
 FxsQnY5Au1TC5kKcyqv1eotAcfexkDMKrhbTvw1elkRr+6vt22jw5dp7CFyz9mrj46lE
 qlsLCVYNH1QcH3PnIq0+g7CjrHl1YjJwoJmDuZKMwoG6JETgimDsbxCFHjAn2DbiibZm
 ojjKBjsxulP/a449ucCj88z758tWh/JlCv+x6N5kR3t0vQ8Xl5N6joRZCd55kiqtJRON
 12lPjEYFPMbkx7Qi+Phcrye3vIurm0u1Pti+A1mt+1GyGAQQHLvlMXOxnrnn0FvvHReG
 prZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiInSbCNTWtKQbpszb/SEXDVr1VG13OS4aY/H5zGns3dMQFSSi2V18k7xhrNSmWH3VA/Bj5hd55Q==@nongnu.org
X-Gm-Message-State: AOJu0YzIUo2Xxt7N8/Rm2Mmt3waiwrDV4UCf2nuNwOjFjnaVq+i7Ab5h
 1KVul7dMyzmdIwR4VCu+VEIq5+ZGHRR3TLJ71ycygFjigCFmm7ywgHQ1Ke+HFbwFzPw=
X-Gm-Gg: ASbGncsRMPyLwj4vCcn1rKiY3t4GXCTZYgldb5jJLk1njrav5T86de/jI6HXNmaf8Y2
 3vr1/IBoEXY5XUuYZtj87Wrk/4pUmUP9yei+fbsueZpLVXDGnqFJG+wRJbNFg0MKda8XWl1sU/d
 ioEirl+6P94IcW61derzsQsp5UZMvbzViQbbiepMKq/srf2uA6A/RYqp5DsaNjPihHSHLv6iDRH
 jXJkGyojoWieC1ZMXJjVTMwxwEA9OfoJK0cBDJeLVew0Hg2TfkwzIDFSl9gUaOHgSQJXNXTgl8a
 EqtJMzEsLeAJGs4/uhlNyPSU4nmCvURPMfDpWqG5XkOzPSCBr4PeAAsOkjkpdl3gY8iEGV+rhDd
 Wu8lU8kypnuKzGlG3QFbzYNhW6RlJurBzxCG7EJJtlaHFAHsBXfrho06KYMOG4echPJi6bUMl+K
 yt1+dioUen/5yHgw==
X-Google-Smtp-Source: AGHT+IGzlOuvRIdoLUeevMgDFcx+Z4TA2VXUfzyLu7lZ+6TXLw4NBe2uVrQYbly4Jxdcd8d1I5Btsw==
X-Received: by 2002:a17:902:f68c:b0:27b:defc:802d with SMTP id
 d9443c01a7336-290caf82b93mr202055385ad.28.1761001713983; 
 Mon, 20 Oct 2025 16:08:33 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ffb815sm91117745ad.50.2025.10.20.16.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:08:33 -0700 (PDT)
Message-ID: <8babd55d-f700-430b-a60e-a412cf103319@linaro.org>
Date: Mon, 20 Oct 2025 16:08:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/30] qemu/target_info: Add target_aarch64() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020221508.67413-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020221508.67413-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2025-10-20 15:14, Philippe Mathieu-Daudé wrote:
> Add a helper to distinct whether the binary is targetting
> Aarch64 or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/qemu/target-info.h | 7 +++++++
>   target-info.c              | 5 +++++
>   2 files changed, 12 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


