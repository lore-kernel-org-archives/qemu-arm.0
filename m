Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6899045wrt;
        Thu, 31 Jan 2019 06:01:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaWwEOT+stX+yT81Ei1mbDYhWu19m/vYjx/8U9+/MjkYLOq8cEVB7F6Mt14Ffnaf5Ya5ymf
X-Received: by 2002:a81:b64c:: with SMTP id h12mr9549306ywk.296.1548943271005;
        Thu, 31 Jan 2019 06:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548943271; cv=none;
        d=google.com; s=arc-20160816;
        b=D4Tjxggl3n2DVoCZ6nq+2yqM1XNQsNkEnCrPT2vm4tZqY6EvMNkwZblXaI2RXdW+qK
         0tZxwNrhWh3f+l2y+Ck2gHl69XbIpx/BVWvYfkRHIkCqHEAMNrEIIsZ8V01kf0yG6hg3
         AcPux+6DwUGSSH19Qqg7mix2+Yjqb04q1PoO/soQAF36MlNpovLvmen4rsmjQaGEND1E
         kCgPQUQD5qhqTgg/b74wwUFtVgm/k9I8kD/3lMB/FHPH5vaFA1jHxjkKLBu0PxFYDb++
         lA89xu1OZHWXiFwQpxU54kfPpTCuc3gAI3kh/1Qq8RhetNFkiHc9vrsiz0JvQLV7p83n
         haKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ZKgrI3CI0UAGH3hVxExxOg3LrZob3oVsOiXseAWBrr8=;
        b=yzKVwOKF+iG41IHjDpoS0OqERxfuYneayFMjEQFpTAyGz6uFU7hTKkYhyJBRSBsUKb
         2/55zeLb5bbP6+X91kgXfWvuFVr4T4HWhoQzVMI57Zhhljca5Ei7497HwUY0HQxqz2w2
         f8kKbESnQ4oh+A/ZwKR53rabMvYJnfr4QmtGaaTM0AbAddyXit9bTlG7fNTMxDZM9pwO
         wCvshYrsU7YwqGA687P1H8MLSILELiwIfaY+rnhp7Bwp1fbXZz803PeaFXXf64wTpoBa
         ad7/C63AhR47o9AKANYhGT0s8xjKZMmbItfe+fKqLLcclh7mos0pC5K0QGts4RKJUWhP
         Chvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s62si2750758ybc.162.2019.01.31.06.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 06:01:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpCty-0007YV-Fo
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 09:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@duskware.de>) id 1gpCr8-0005nf-TV
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:58:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <martin@duskware.de>) id 1gpCr8-000871-Ax
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:58:14 -0500
Received: from mail.duskware.de ([91.199.88.144]:54405)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <martin@duskware.de>)
	id 1gpCr6-00082H-K0; Thu, 31 Jan 2019 08:58:12 -0500
Received: by mail.duskware.de (Postfix, from userid 205)
	id 990A7A805C; Thu, 31 Jan 2019 14:58:02 +0100 (CET)
Date: Thu, 31 Jan 2019 14:58:02 +0100
From: Martin Husemann <martin@NetBSD.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190131135802.GA3213@mail.duskware.de>
References: <20190131130700.28392-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190131130700.28392-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 91.199.88.144
Subject: Re: [Qemu-devel] [PATCH] target/arm: Make FPSCR/FPCR
 trapped-exception bits RAZ/WI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Martin Husemann <martin@netbsd.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: btc14ChQOJeJ

On Thu, Jan 31, 2019 at 01:07:00PM +0000, Peter Maydell wrote:
> Martin: this is a different fix to the one I suggested you test,
> because I realized we need to make these bits RAZ/WI in the aarch32
> FPSCR as well as the aarch64 FPCR, but it should have the same effect.

This one works fine for me too.

Thanks!

Martin
