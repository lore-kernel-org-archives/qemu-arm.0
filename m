Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp883918lfb;
        Mon, 11 May 2020 23:34:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIR+HiNoswG9LAMzU9PHwlAmbwMoDn7yGcRXMmRZuBiUS+VpzPClWPimUNdbW/cRXTY3ur
X-Received: by 2002:ac8:24e7:: with SMTP id t36mr13867942qtt.360.1589265269713;
        Mon, 11 May 2020 23:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589265269; cv=none;
        d=google.com; s=arc-20160816;
        b=IBJYrW5sRaz4PNzSpSNjN1YEdTVZGstw9ZQnnnM+YpWHbXPRGiGp9w11kt3R9nHY/b
         xK/PL7KJ2GRbgdHxCLaJN58FDvB8MxdrYmzdSEP9eX7m2mz2Wwdcn59B/Y7seRC4fPpR
         c1lqiZx63Rhj65s9cLacb4fPyB/xvs6oM4QLIfFlc7f52Yr8B7fT7QO9Y3S2MydIpFzg
         e3ARDC1yFfxJKmH427eGV2Y+FpK6NsQH8LEOm0CytLNM2/xXprJj7SGHm0HOhf8usUjw
         wAGvB5h3p+UJchxlLWWJa2yqxKjfFfOH3TEsCoExdP5oNIQAH1PH4Tr90ANX8/QwkEHV
         p7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-signature;
        bh=JCusBzwy8B1uDd17LgzWIUtUKGYE2Mkj9ONUU1JKpj4=;
        b=NLWRYR/1sqGzfgZyaORwij/8+ag+ZDKRod4kOPXz9XQxZm4C7IBLOW7aUr60JM1taQ
         vdtM1MhnnLq1qGlGWs6U3vVj1m89xBUQgwxE96SxY+3lql0Yi5uNmX28pw/f1zXK/4ia
         WqDhMIsnhdkrzXDDjeqVbfLQFSgCl97C13sdcxxHdcSVj1DhAu7RboSu0wUS4FE2a0Sw
         2R34ihFZKgp/q6irAwF1P7THJy2nSZNjlxxu4ft7FOvVp6LGz9bzCtfqtYq+ryOmisNB
         OlMuYLjKOmx3mYrX1/zpNS4o55RQLAvDeuRheWKOSKd7Rk+lvRAN4GFO6O8DwDE0QphT
         7hMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YbVB8SQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g47si3597903qta.235.2020.05.11.23.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 23:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YbVB8SQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYOUn-0006TL-6k
	for alex.bennee@linaro.org; Tue, 12 May 2020 02:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYOUf-0006RH-FJ
 for qemu-arm@nongnu.org; Tue, 12 May 2020 02:34:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54324
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYOUd-0006jW-W4
 for qemu-arm@nongnu.org; Tue, 12 May 2020 02:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589265259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JCusBzwy8B1uDd17LgzWIUtUKGYE2Mkj9ONUU1JKpj4=;
 b=YbVB8SQXAjsj2rGT9tsmVw+QAqrymcpu67ibVUAbd0lJTVB34eIMa7gofil68jg0ONcev+
 ypEo3nsiN78WSL4W0Zl2bBdLfbeWZ2hHF9zJn/KUQVDCInSpyQgy7mMH9xTAHhj1y1Mk75
 5hUqbtZYH8kFqCm5YaomFjRQ3L4lFcU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-lKVDuOecNjaA6Pc0KyUk7w-1; Tue, 12 May 2020 02:34:16 -0400
X-MC-Unique: lKVDuOecNjaA6Pc0KyUk7w-1
Received: by mail-wr1-f72.google.com with SMTP id j16so6431356wrw.20
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 23:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=JCusBzwy8B1uDd17LgzWIUtUKGYE2Mkj9ONUU1JKpj4=;
 b=WOYKS+wxAMd42FQLw45xVjkDQtl1oETpeWdbE7zbBNX4zwiUn9U6Iu8DQfDC7FEZ0X
 gq5o+f67pQdhPtBCurCBOqe64pW432eqZ3npguQ56x+ABHfSxOE+6YNDHmTXxh8TK27F
 3CcLAXJTkwun+VuGf8asU5NfwLOBOjsEPbYukbnfxDbXCVc6lFsqvRi9cpR/fe0D03+Q
 dkgRGKfiMt2P407RtRiq13c0/rFu3WRMTGjuUEwuBQ4UtkWY+wmYDrM5CEQM9eA3KkUN
 NdyMOuXSURQLRvLGcZGz8VyrwDJssUDCEE5QtL5puAnrhQQP8tvzeNEbA3UCaH183GkE
 0idg==
X-Gm-Message-State: AGi0PuYmteAG+V9s+iLWb9NVhUskPg2khdDRURXUfPKQFiO++1/hDuOn
 EnEw7Ni3pd9IeGLNL6mJ00MVEPlvZJXSLPuqgr24BAIHRPI3aNteIpSciQImEQTQnFibG1on8My
 LheYC1VlGn5P2
X-Received: by 2002:a1c:a3c5:: with SMTP id
 m188mr14416907wme.160.1589265255221; 
 Mon, 11 May 2020 23:34:15 -0700 (PDT)
X-Received: by 2002:a1c:a3c5:: with SMTP id
 m188mr14416878wme.160.1589265254938; 
 Mon, 11 May 2020 23:34:14 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q5sm14215476wra.36.2020.05.11.23.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 23:34:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: SBSA-REF maintainer email bouncing
Message-ID: <dcb8d325-a2af-0c68-ad64-87f41521d4bb@redhat.com>
Date: Tue, 12 May 2020 08:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 01:41:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: radoslaw.biernacki@gmail.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XVc09vqN6qPG

Hello,

Radoslaw Biernacki is listed as maintainer for the SBSA-REF board.

His radoslaw.biernacki@linaro.org email address no longer works,
apparently "Radoslaw Biernacki no longer works for Linaro".

   SBSA-REF
   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
   M: Peter Maydell <peter.maydell@linaro.org>
   R: Leif Lindholm <leif@nuviainc.com>
   L: qemu-arm@nongnu.org
   S: Maintained
   F: hw/arm/sbsa-ref.c

