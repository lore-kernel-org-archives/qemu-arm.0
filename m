Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4413736lfa;
        Mon, 2 Nov 2020 17:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCkCspq1Jb/J+eLW7btLp2f4VDq1kqiPUos+ZkYCjIi5B1n41pWiagofSLFzXVh6BZIyZU
X-Received: by 2002:aed:2141:: with SMTP id 59mr16921765qtc.117.1604368417189;
        Mon, 02 Nov 2020 17:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604368417; cv=none;
        d=google.com; s=arc-20160816;
        b=StbWbGQUo6hCJNiAMUOqvB2ZzdEyP0qtiU14uvGsjxQPf54w8EkRoM7JRoeb97QNqp
         rqdyrQ18kyioj7d+gkQKSTHS/C0/oPVEXUALeTCgXbg1nq9T98am5YetjWjpBXhZ5jSL
         aNg2G4puRb7q9rgDEqlwXssVZ4Ft3Ggohzx38k/SnBgwuJmrDYjpidI5nPFpJPuDyzLf
         0XQ83Wco1D9AR5jsg68zwuXo9JCqPZ74erKCih+2GqC/vCri4WNcSS4ss4T1c2UXpPgO
         LyGk69bEuiUS5R4Q0MpTCHxxZVnbt3MuXJBLRw9tms0+reHPB/pZdm5n71NkTv8Wp4s9
         VbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yQh3j0ya4FkuELdIrOQG6llK5JJkZVpPImMv0NSBfXE=;
        b=uHsRuTxAxsw3NHpA19f2xyoP7fdQauszxCx4AiXca5HuAWCQRGqE2lcZugLgejbTp5
         8cCAx38/wL8f4sXxkE1oTZCSsWEwnrZnMbiTQT2ogQRRoNVxBjaitg9Aq1SNOj+ANXKO
         iFcZZu8ppHFbr7clA6GRuG+4fZUzcSiNsVw43RBXSu1tTR0kJgM8YtoCl7kVnttW6Eko
         aTLuiG3+osJ1PsBaJh3gSCl0ergh3v/MzCiVdwuYrDq5Rr82wdPRH+gVqcN16DpPBO5X
         tn6lUGd4mjGr3c1gkEis6sHCA90ULp6k+m5XkVuSIpyEbSt97puYpHtQAgLddsz+ZlU+
         ZFKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S2do1pkQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si10053519qvy.12.2020.11.02.17.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 17:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S2do1pkQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZlVw-0001aE-Hp
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 20:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZlV8-0001Zq-Vv
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 20:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZlV0-0001lC-MA
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 20:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604368357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQh3j0ya4FkuELdIrOQG6llK5JJkZVpPImMv0NSBfXE=;
 b=S2do1pkQJTJo2qLRPq3qLIuhOxCCD+/vz+Q6ovJdlDIYGoCRgJsEuSzj2TOZWXtcSLG/1I
 /UfTwDVToIPn1JjZ9o6OA0fvfimDIjntP9GcEV45+3AP0P26ZexPdjeJleTJgWMP85/yBh
 40fR/oUzRmLDDrwo+zLhEdkB0irfoCE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-vP9e4lEtPTShxVg7MYSC9A-1; Mon, 02 Nov 2020 20:52:33 -0500
X-MC-Unique: vP9e4lEtPTShxVg7MYSC9A-1
Received: by mail-wm1-f69.google.com with SMTP id z62so4805659wmb.1
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 17:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQh3j0ya4FkuELdIrOQG6llK5JJkZVpPImMv0NSBfXE=;
 b=Vvqf68FOujuRieK0mzZGv8B3gzx0aXIrmaTAzQPL9QK/TpdDuqSBPWHVnmIaD9gFPX
 2jfBT92F89Dl4gudeYW/w2jbrPTzJ+EBudAk6HXhB9ThvS7RxOBSl9wCBpHePhvmMoIw
 Q/p23nlApSwhd5sL1uIUqS8InAaJk0FbOIxN95VNbsb3ZJW9j3Ceux1m+EQ2qPjwwJph
 0/Zohgja0yqBVfkhb9x2oEalixJ6sXqv2dEsA3zxUkRCKoxPh40zq7TSl+AOD/olWi41
 WYvzNFT4npfnIg+RTdreEmqZOa10nEHDcaj6F4pqwGfVYzgiRSNPF5d6in1nUe0a7K+L
 rp4Q==
X-Gm-Message-State: AOAM533bccwI3ghVSDzZq0PevgnDnKXTCWQ9OIcqjMejW7TpZqcOUxUz
 t7te9qQISjLWMsHm9f0H/WXJbj57ZNVvcGMpFjEuF8cFyf6DF4IPshRD+PLLNLi9y/FxW8Uv6RE
 G3rc8e9bJRoW6
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr22656931wrr.377.1604368352541; 
 Mon, 02 Nov 2020 17:52:32 -0800 (PST)
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr22656910wrr.377.1604368352245; 
 Mon, 02 Nov 2020 17:52:32 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f17sm1339282wme.22.2020.11.02.17.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 17:52:31 -0800 (PST)
Subject: Re: [PATCH 0/3] tests/qtest: npcm7xx test fixes
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20201103011457.2959989-1-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d41219dd-6cac-f4a4-d559-27ac9b9d9554@redhat.com>
Date: Tue, 3 Nov 2020 02:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103011457.2959989-1-hskinnemoen@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQHez3TUzmO4

Cc'ing Daniel (patches 1-3) & Marc-André (2).

On 11/3/20 2:14 AM, Havard Skinnemoen via wrote:
> This series contains a fix for the randomness calculation in npcm7xx_rng-test.
> It also makes test failures fatal. The last patch would have dumped the random
> data to stderr if the randomness test fails, except now that failures are
> fatal, it never actually gets a chance to do that.
> 
> It may not make sense to apply all three, but I'd definitely take (1), and I'll
> leave it up to you whether to apply (2), (3) or both.
> 
> Havard Skinnemoen (3):
>   tests/qtest/npcm7xx_rng-test: count runs properly
>   tests/qtest/npcm7xx: Don't call g_test_set_nonfatal_assertions
>   tests/qtest/npcm7xx_rng-test: dump random data on failure
> 
>  tests/qtest/npcm7xx_gpio-test.c           |  1 -
>  tests/qtest/npcm7xx_rng-test.c            | 15 +++++++++++++--
>  tests/qtest/npcm7xx_timer-test.c          |  1 -
>  tests/qtest/npcm7xx_watchdog_timer-test.c |  1 -
>  4 files changed, 13 insertions(+), 5 deletions(-)
> 

