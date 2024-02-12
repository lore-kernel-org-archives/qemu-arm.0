Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp44206ejb;
        Mon, 12 Feb 2024 09:19:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwcJgQPEtKXFnx1iFI4dunytQ4Sb3kJw0ujcrRtEf9RLdu56G9OsKwA3Eg1blMfwWyspCM
X-Received: by 2002:a05:6808:1146:b0:3c0:8d2:ea40 with SMTP id u6-20020a056808114600b003c008d2ea40mr9303501oiu.31.1707758364305;
        Mon, 12 Feb 2024 09:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707758364; cv=none;
        d=google.com; s=arc-20160816;
        b=fDDp5Q3rnKN8xAAcGtwsIk3XDDJXc7LsWKlI8ajcG8aj9KNhzUJF+V9INdEnXGV283
         +4R43P2W5Z4Jyz45iFmoeGkpWH1sBUTGifMdxlIy33eTqtNe9LauFmvMpX8pwQyBY0ry
         N/t+vjfJKwHajEEQRUWWY2ug3FefZPKKZSv1C963a0fg284bEMWX6EYhgKvOPq/p5KbR
         kBrrKA4bNP2nXDKH+fj/Ll21vVjyX/eRAxTYcgMttnafSUKU3LjQi9WJsF3S7dSkK5MV
         YDooO8kQ6yHfpR4TNuNCLbPXf8MZqonDpb3OeYRtmm0mB1ytsncTPD77OA+zRzBiH6J+
         dYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :message-id:user-agent:references:in-reply-to:subject:cc:to:from
         :date:mime-version:dkim-signature;
        bh=d3TBmoN3liWIFW41HYSrIkosX+dsMqitZWLjvNtosBc=;
        fh=gvLZ08bNoRP+3eAhvp35wVGr93Si2Q0mvnEj91jTT0o=;
        b=O0zNyiAepYQk46YYgRNVYbfRgciGx3md7A1P1dwoBw/qflsTsVaRlPMYE1fk3krlqO
         hlY2kWPiTblrW5rxctPiwPNV9JcBNluHoOgFDuo0wsePQMizCxYI9NyCr/BRy/0rLkv6
         3ybwbavTua5dbcDubwSETDC0Vh7/OzmHNNLgKdHM9L4gmenkUIre+q2dK/FIKZ0VskYJ
         WemuQsTfYCCvUTuTabDMW5Rmwjie35HSRX26A7zbbRmNrzrtZX4jG1V6wRqWUwoTOqly
         PGwHR/78wTFYlkKkOhKTpRKOJJPqjCVQm2sPUi9teGPuaBIG0uxfqKQ/q4bhE3Y5s5FL
         Wa6Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UtpUGtq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
X-Forwarded-Encrypted: i=1; AJvYcCVTTOQV4OziSE/ZaGXp59eEEeHG+My+VAiDkqrJKAm2Bgsj9Ew2uTeqWaYFtyqOZQB2/2ZgDNniv8v3lX99/A728rSM7BJt
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a05620a438200b00783c0f3abd5si7110322qkp.98.2024.02.12.09.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Feb 2024 09:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UtpUGtq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZZxO-0001Y0-FB; Mon, 12 Feb 2024 12:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1rZZxM-0001Xh-PZ; Mon, 12 Feb 2024 12:19:00 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1rZZxL-0005fq-3Z; Mon, 12 Feb 2024 12:19:00 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99E5560F9F;
 Mon, 12 Feb 2024 17:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A57C433C7;
 Mon, 12 Feb 2024 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707758325;
 bh=V9l0zQ5i8oB0x7537ZCInnxfHXbuws1rjzVUecT7Nes=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UtpUGtq44Iu7WFGUxVR8Sc5TqXKOQkN8AIlAj8WK8/I/fv1hVjEhNS+o+wR+nKJ+L
 V/WTDdnKocyPCN5Xuqlruukuf3gNZx/zIDIKBh0yxy5L+kl/9aaPO6PY7xVZuZ9Cv1
 Jns5lacvKD90sVTY6MppI0FEpyFvAe5hCf6nHVf5HSMqp0TUGEu47G3Q1DIaki4bKS
 7TpexyyLeGzUXNN88Fah25UKk2nD90VxYxsFBvUsHRh43R6lKxlXrGBejPK1OyDBE5
 qjkoG9FUFIaHE0nPUvCqqTjGrRB8YLxx/7I+GdaSu3TVtluOxEBO35JJO/Id/oWm52
 qCfp08vdojZYA==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1rZZx5-002Uv5-5s;
 Mon, 12 Feb 2024 17:18:43 +0000
MIME-Version: 1.0
Date: Mon, 12 Feb 2024 17:18:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 haibo.xu@linaro.org, richard.henderson@linaro.org,
 gkulkarni@amperecomputing.com
Subject: Re: [RFC v2 0/5] ARM Nested Virt Support
In-Reply-To: <CAFEAcA_SFtmCCFBPwWjJF3uygdpdqoZuYLaQQP186fyQ+dJEHA@mail.gmail.com>
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <CAFEAcA_SFtmCCFBPwWjJF3uygdpdqoZuYLaQQP186fyQ+dJEHA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <d9da1d0ab970be3471187224241f3cee@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org,
 gkulkarni@amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=139.178.84.217; envelope-from=maz@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -78
X-Spam_score: -7.9
X-Spam_bar: -------
X-Spam_report: (-7.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: J6c5oVzy96xG

On 2024-02-09 18:57, Peter Maydell wrote:
> On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>> 
>> This series adds ARM Nested Virtualization support in KVM mode.
>> This is a respin of previous contributions from Miguel [1] and Haibo 
>> [2].
>> 
>> This was tested with Marc's v11 [3] on Ampere HW with fedora L1 guest 
>> and
>> L2 guests booted without EDK2. However it does not work yet with
>> EDK2 but it looks unrelated to this qemu integration (host hard 
>> lockups).
>> 
>> The host needs to be booted with "kvm-arm.mode=nested" option and
>> qemu needs to be invoked with :
>> 
>> -machine virt,virtualization=on
>> 
>> There is a known issue with hosts supporting SVE. Kernel does not 
>> support both
>> SVE and NV2 and the current qemu integration has an issue with the
>> scratch_host_vcpu startup because both are enabled if exposed by the 
>> kernel.
>> This is independent on whether sve is disabled on the command line. 
>> Unfortunately
>> I lost access to the HW that expose that issue so I couldn't fix it in 
>> this
>> version.
> 
> You can probably repro that by running the whole setup under
> QEMU's FEAT_NV emulation, which will be able to give you a CPU
> with both FEAT_NV and SVE.
> 
> Personally I think that this is a kernel missing-feature that
> should really be fixed as part of getting the kernel patches
> upstreamed. There's no cause to force every userspace VMM to
> develop extra complications for this.

I don't plan to make NV visible to userspace before this is fixed.
Which may delay KVM NV by another year or five, but I don't think
anyone is really waiting for it anyway.

         M.
-- 
Jazz is not dead. It just smells funny...
