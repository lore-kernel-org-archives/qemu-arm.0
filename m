Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4205487lfk;
        Thu, 27 Jan 2022 08:18:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR25ZbaFoBDy7v38oYUcnm/k83supIl1GQBBEuqTpJnzg4hexowaUcPOWYYPMFRwHrieyp
X-Received: by 2002:a05:6638:28f:: with SMTP id c15mr2195483jaq.188.1643300308570;
        Thu, 27 Jan 2022 08:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643300308; cv=none;
        d=google.com; s=arc-20160816;
        b=vpCJYJ3z6jsYz6Y3RmnF1h9jr39BZu5pwckhsnAllK8hGjuxNK3Oql0B3jI3CL8e+8
         yskCeFYUkK/SaSPtYb79w1pLnYjDNGMAXo2P3D5IwDM5CGka909z5w9aFxwUD+n5wFC9
         NBhE2sxpKabrr+NsO7q+fcsyJVhPtulBlpyD9qTBgzN/gV9QCnfiBMuGz/DWHkUeNqTv
         qLT7Ow3qCpa06f4YSdAlpyFOge93bZtSN4wP1Gz7B74H47dUgZ9/LMqsiIc97zu/DC8/
         oJUjoFKakhNN6rAZZURcttRCj4H+Wbc1527z9qcTS8tkLkF+TLV9APBzaWd/dqwCArxK
         DsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :content-disposition:mime-version:message-id:subject:to:from:date;
        bh=YZCyydXJjVF9BFUjprEQACKJugo2h4kcEY90d6JuO+Q=;
        b=xr093s4C5Hl0fKElZ57WmL0CktwPj5/2/Pk6oFRTtC+eDR/IlSTk9dZ86v2g1aJPl3
         w1cy35q8ORg+eRq5p1Nd7TGGjO8iXFxvSvLK9wfBgt9kZlKy93l8eHPXRbAe6RZ6F7ga
         wJhANXyR4IGCvLWKp72Fvst/HGcAoXuTJVHCP5vb1/312FcBVwdG7Gy2PihU4sTagt+1
         qDobFaMuF5Ks9zVaq4gZRnc+iwQyNdVHoiDciejQ5FvNEV9N9RyjXY8bpRwEAovZWTpJ
         1ZikyijpOiHDQuGX5YbuZ6RQzzMgk7k4oso0/RRBsoLewmqAZo9IHJRC6NePhuLqGCo+
         HlpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si2348103iow.100.2022.01.27.08.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7Tf-0003sa-L1
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:18:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <spamtrap@tmp.com.br>)
 id 1nD6tC-0006X0-3O; Thu, 27 Jan 2022 10:40:47 -0500
Received: from angmar.tmp.com.br ([188.40.49.187]:36044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <spamtrap@tmp.com.br>)
 id 1nD6t6-0007IB-R9; Thu, 27 Jan 2022 10:40:45 -0500
Received: from angmar.tmp.com.br (localhost.localdomain [127.0.0.1])
 by angmar.tmp.com.br (8.13.1/8.13.1) with ESMTP id 20RFhZ5j006220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 27 Jan 2022 12:43:38 -0300
Received: (from spamtrap@localhost)
 by angmar.tmp.com.br (8.13.1/8.13.1/Submit) id 20RFhXSg006219;
 Thu, 27 Jan 2022 12:43:33 -0300
Date: Thu, 27 Jan 2022 12:43:33 -0300
From: jmqemuml@durval.com
To: qemu-arm@nongnu.org, qemu-discuss@nongnu.org
Subject: How to create a Raspberry QEMU VM emulating the physical hardware as
 close as possible
Message-ID: <20220127154333.GC487@angmar.tmp.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.1i
X-MailScanner-ID: 20RFhZ5j006220
X-TMP-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-TMP-MailScanner-SpamCheck: 
X-TMP-MailScanner-From: spamtrap@angmar.tmp.com.br
X-TMP-MailScanner-To: jmqemuml@durval.com, qemu-arm@nongnu.org,
 qemu-discuss@nongnu.org
Received-SPF: none client-ip=188.40.49.187; envelope-from=spamtrap@tmp.com.br;
 helo=angmar.tmp.com.br
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Reply-To: jmqemuml@durval.com
Cc: jmqemuml@durval.com
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-discuss" <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xNXaCDVcvAQm

Hello everyone, 

I have a Raspberry Pi 4 model B v1.4 with 8GB RAM, and I need to create a VM in it as close to the physical hardware as possible (no need to be the exact RPi4 hardware, RPi3 or RPi2 would also work).

The reason is because I need to run this semi-closed software which comes only in a bootable SD image: https://github.com/victronenergy/venus/wiki/raspberrypi-install-venus-image

The host RPi is running Devuan Chimaera 4.0 (systemd-less Debian Bullseye derivative) and I'm using the QEMU v6.1 packages straight from its backports repo.

I've got so far as to extracting the image and trying to run it with 

        qemu-system-arm -M raspi2b -vnc :50 -drive file=~/tape/victron/venusos_rpi/venus-image-raspberrypi2-20210411203709-v2.66.rootfs.rpi-sdimg,format=raw,index=0,media=disk

The result is that the QEMU process starts and keeps running, and I can connect via VNC to port 5950 to see the VM screen, but VNC shows only a black screen. 

What am I doing wrong? Has anyone managed to emulate a physical RPi in QEMU yet?

Additionally, hints on how to debug this or other things to try would be most welcome.

Cheers, 
--
  Durval Menezes.
