Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp118659lfb;
        Tue, 5 May 2020 07:19:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypJHqP/9IcDkx40tuFRvShmrhW2kgj4eHPNEPIL0WII7OYC2Wo4OjBtmvLVRL7n8zid5I6EY
X-Received: by 2002:ac8:2f2a:: with SMTP id j39mr2924995qta.295.1588688374176;
        Tue, 05 May 2020 07:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588688374; cv=none;
        d=google.com; s=arc-20160816;
        b=TH8h4ZIfdsxgo9hhzDIG+uM+cM8317OGAI29kjFUCoksY/KMrqa3g5gEKT3+3ZS2fq
         jB4UEqewuUHdZibH50rOQXIrVdB/suD2SRUtgnGL8PJYx2Dd4Xzjm5nOYIx6CCKHCeI+
         wfyfIac4xVyBujzrz+pKe9AQlNUKjMLPs12a5n8183toLivtOKyjNCmPSIZqgcw/OT13
         +Vz6XtT4UzhbjRZ8X6TDkIaKZvzfJyA4lHF5c97ecnpKzyunoGyYaDg+yE85TlacNhsF
         xJ0Emja2IWbe6OVTrlRaAHc2MbIeWclNh4DcKI6MNSkZIXfaRnSwTbV+Ozv9jpQGz6t1
         L0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=bjVoctQqo/4MwwvukrYp9moB4syUyfv4XonW2FlcGoI=;
        b=WbIsoBhxZKycZst/F8JNvdSdZJYCZLhJG6lgJqEVGmAYEHtmBvHouSEmWgWRUuSp/w
         gO7WI2nxtMr1h3eM95+c5J6ovZS575m3iZUlGtGcmuv/pVcbbKQNI+pTiNUYGtd8vmht
         j4VaeKGnx/eACUTu+Sy04OrATVPUb7vx8J+v2/QzsEhPLQy0qSgEXYq7BED3IImqjxxz
         LP+Owow1UrCVpkn15qJc7x5BTMjdyH6vjI97q2nKo1Xrw968xz9jvn7j+MtpZiEV3q42
         ek7ri3Mk9tT+SRNxfSA3HuZoeCI35BwvzMk407Huvqk8fhWM7mN6XrKL4NvvMsLr56FX
         ORFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YfiW7UOw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c24si1384658qkc.311.2020.05.05.07.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 07:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YfiW7UOw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVyQ1-0002WV-Kk
	for alex.bennee@linaro.org; Tue, 05 May 2020 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVyO5-0008Kt-Gg; Tue, 05 May 2020 10:17:33 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVyO4-0005HC-O2; Tue, 05 May 2020 10:17:33 -0400
Received: by mail-lf1-x143.google.com with SMTP id a9so1489928lfb.8;
 Tue, 05 May 2020 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bjVoctQqo/4MwwvukrYp9moB4syUyfv4XonW2FlcGoI=;
 b=YfiW7UOwXhiEiB/+7CPeE2LEgopbLS6+g1YGp0Q9h5/iNNiK/wgufuAbe4+yXtugjC
 uYOKSzKozXybMH6ZZCU84B1iyGXMRxBj5JsrqbnYtgvcget76iiokeTGh8DoryTlQ2rV
 QEoYV8v2s0knNTVm0cTN5OV08fVKFFRqLhK8gCRRJGxSfvEePKqJ1L9CHBIotNifcl/d
 LAKmgi2X1IMw7QRKguda2SnizZjyHuA0WIkh6Id8Wv1uwyk6nbFYmEC69ZsMGSEXapA1
 goEnbReDnA5v0i1KVT2PTDjcPXsE+FyKwxCn1Nyd4BaT79OEZvmfZr9M7bqPvBF+PtXl
 E2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bjVoctQqo/4MwwvukrYp9moB4syUyfv4XonW2FlcGoI=;
 b=CfpNhEFSMMyjn2aOubh0vXQRY7Il6Cbw0U7PeDr1aCU4Da1uMDQlFVVCuKtwgViHR+
 HfFyPuTCdHmr3m3g/y+4eF0G0jb4zRWQfkD6rAdUZuL7t/FdXaOPgZqwqpgvS/QUk3vE
 qxnZe/Ogpp5WXJtIMQDahhUgFZ46LVjtjplqWfC7IOkbrg2+7p92E76TdoYC1AAlWzE6
 tKI24gdWXTLfa8OXmAug7QOHkUiVzWpxQy9aJk2gLVeXpYw5O1Uba4EmHcRuduv4X90r
 eIvXWudUJ5mpYUS3F3H5YqFlKuXf3n5tPZ8XaGoucTqJ9VnV2HwQAUVdip01FF7ch6Fa
 Adrw==
X-Gm-Message-State: AGi0PuYFhc0E2tTokeMNcLm1wEeW/Uk+WVIxK9clLELi4gT4Ia/jYTfv
 bGOaj68Uo1wL0mgJ6jQnrQSn+piOL4g=
X-Received: by 2002:ac2:5684:: with SMTP id 4mr1851708lfr.88.1588688250294;
 Tue, 05 May 2020 07:17:30 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id t16sm1878625ljo.6.2020.05.05.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:17:29 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] target/arm: Remove access_el3_aa32ns_aa64any()
Date: Tue,  5 May 2020 16:17:28 +0200
Message-Id: <20200505141729.31930-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbHwpj2fQvqU

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

Laurent reported hitting the assert in access_el3_aa32ns()
when accessing 32-bit versions of some of the virtualization
regs when EL3 is 64-bit.

I think we got this wrong back then and it seems to me like
we should merge access_el3_aa32ns and access_el3_aa32ns_aa64_any()
and always call the merged function to handle both aa32-only cases
and mixed aa32/aa64.

Cheers,
Edgar

ChangeLog:

v2 -> v3:
* Update commit message and cover letter to reflect that
  access_el3_aa32ns_aa64any is now being removed

v1 -> v2:
* Keep access_el3_aa32ns in favor of access_el3_aa32ns_aa64any
* Simplify description of access_el3_aa32ns
* Tweak secure aa32-el3 check in access_el3_aa32ns as suggested by Peter


Edgar E. Iglesias (1):
  target/arm: Drop access_el3_aa32ns_aa64any()

 target/arm/helper.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

-- 
2.20.1

