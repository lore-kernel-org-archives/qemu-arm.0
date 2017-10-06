Received: by 10.223.197.9 with SMTP id q9csp1948339wrf;
        Fri, 6 Oct 2017 11:48:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDUUp+dQUgm7/Xzz+9VfFEWqf4FjibjdOQtfkNgvCtWXILW/53RQ1eq+KCcHt/2xJ5AilXG
X-Received: by 10.55.167.22 with SMTP id q22mr25154472qke.234.1507315723363;
        Fri, 06 Oct 2017 11:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507315723; cv=none;
        d=google.com; s=arc-20160816;
        b=dOXkHoc+w/5P7Cm+BDuk+fBz9UjiOvt+WjWI30zNTSYHA2wHk/ihr6Hif22rWLXVg5
         gGxLZvXuIegsRb+5HMyOIWsKCbIcDH7Sb2PO59cSZX1nkm0tn5fNHdFqQraMczUu5Fdb
         5FAnf6ETGe+ocH+Ze7VnGPa8emp3/tD5gVWbfU8pTW+ngBJyrOFZLQPArky2n7w5Gxkp
         OVzIWGpuB3CflbaUKTkpOgOSs3L1q+t/g+/C5XmGnQV3ZD1CdBy9O7MAiyb0gYoG20hF
         /tztAuPIT98hpmFyI5V9fbyoCMg4M8U1er9EZWg8Dd74vs6ZWdPmM0Kt3UtZ/JYKrUhu
         feiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:dkim-signature
         :message-id:content-transfer-encoding:mime-version:date:organization
         :from:content-disposition:to:arc-authentication-results;
        bh=nd65bBZXkYZYQRve6JadHX5dUl4LUQsDbAK9vx6NREE=;
        b=yttkiP4Xw+sVskr2e6/HkApGTnzFNZEPtsCO7Zn/OSX4+nBa0vl0qgdTmloS2vL9IX
         QvXP4mlZoeHLe/IERuyWZ7bFWd+yA/oBjwc/K2GL8LF+dL+38OojfP7jS1rhiUFe2foT
         xkoa2tUpJGTQkuFCxKn9QsasQOBkwGrSkHHsDc4CKRImfowQgUDp9ic2EMr9Lu9B7USg
         bMTnjum+lgvt8cbgjrMDPd3S/bw5irbwX7kUaG6M4qt1C6vec7HavspcmaH61dZM4nDd
         I/W9CkKAYCKT62QNk7AIsGOYza3V2mi6tVtszp/2AJ45j3Mm+68zhEFhHmicRnZnoMVy
         8Jsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@tiscali.it header.s=smtp header.b=334KoSx0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si560381qke.366.2017.10.06.11.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 11:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@tiscali.it header.s=smtp header.b=334KoSx0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=tiscali.it
Received: from localhost ([::1]:46768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Xfu-0002FN-VB
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 14:48:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1e0Xfk-0002Cn-8o
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 14:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sacarde@tiscali.it>) id 1e0Xff-0004AV-Dl
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 14:48:32 -0400
Received: from michael-notr.mail.tiscali.it ([213.205.33.216]:54163
	helo=smtp.tiscali.it)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sacarde@tiscali.it>) id 1e0Xff-0003uv-26
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 14:48:27 -0400
Received: from arch64 ([151.40.176.48]) by michael.mail.tiscali.it with 
	id JJo71w007131j4v01Jo7UZ; Fri, 06 Oct 2017 18:48:08 +0000
x-auth-user: sacarde@tiscali.it
To: qemu-arm@nongnu.org
Content-Disposition: inline
From: sacarde <sacarde@tiscali.it>
Organization: sacarde
Date: Fri, 6 Oct 2017 20:48:05 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201710062048.06527.sacarde@tiscali.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
	t=1507315688; bh=nd65bBZXkYZYQRve6JadHX5dUl4LUQsDbAK9vx6NREE=;
	h=To:Subject:From:Date;
	b=334KoSx0bYd9MR8rvsXVE+7OMFRP4CnuWWV4UqsOMJoLKeFWwLypNM12hWhbz5kmT
	Nhgo4b++kyfRyRsuG9FjeR+b6WZteINMtwukzEXpA72ZSfioiUzo9GSN/yo6ekh49Y
	/n0sjkRWVlYT+CaUdRR0OLWHfWPI9eWF6kSPi0I4=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 213.205.33.216
Subject: [Qemu-arm] ubuntu-mate on qemu-arm
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QjyIg3M9sdgs

hi,
   has anyone tested:

ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi

on qemu-system-arm ?

which kernel is used to run the qemu command?



thank you


sacared@tiscali.it
