Received: by 10.25.150.194 with SMTP id y185csp714406lfd;
        Sat, 19 Nov 2016 13:17:21 -0800 (PST)
X-Received: by 10.55.6.13 with SMTP id 13mr7224875qkg.272.1479590241040;
        Sat, 19 Nov 2016 13:17:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h38si4224229qtc.9.2016.11.19.13.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Nov 2016 13:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c8D0i-0006MO-4d
	for alex.bennee@linaro.org; Sat, 19 Nov 2016 16:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1c8D0e-0006Kr-2b
	for qemu-arm@nongnu.org; Sat, 19 Nov 2016 16:17:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1c8D0d-0005EJ-Dv
	for qemu-arm@nongnu.org; Sat, 19 Nov 2016 16:17:16 -0500
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:33001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
	id 1c8D0Z-0005DR-An; Sat, 19 Nov 2016 16:17:11 -0500
Received: by mail-io0-x242.google.com with SMTP id j92so2014663ioi.0;
	Sat, 19 Nov 2016 13:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:message-id:cc:content-transfer-encoding:from:subject
	:date:to; bh=MV/Gn1uV1rlQiN1OmWKwrd03B1zPHmSAuzRm2SUqehw=;
	b=Dz9W0JQRztJcI2b/Bk+5nEQrE76OrE+8qv+9N4oFrnNqWUvNUMt4a/buHn7hk2fnEi
	WrilDMu02B08/yjMwE/k4/uplLxo1e00MoB9TmoQcksoI5x2Watg5i3Ax6cl9s442T1Y
	C6vUhQXzzUa0rv6t6eFVcbPUnfpEjTSd58v+nQ4MPk+nbpLYufGuJ3WcVaD1XvZEbQ+o
	7OFqMsx002Q+QEMBMs2uRA7D0pzugJS9ibnpsfSaWaukQoGn7tXYZfwHJOyhJa2qLP6+
	NwYESuOUXyp30uwzCoXSJJnAWQgENRprS8yDChFt7wqCaXQZDW/9qryjCi/z2aWyxzTf
	qoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:message-id:cc
	:content-transfer-encoding:from:subject:date:to;
	bh=MV/Gn1uV1rlQiN1OmWKwrd03B1zPHmSAuzRm2SUqehw=;
	b=ImACRn9Dg1xUesXH9hrA07J+3vwgPeo4oofY9IB9cONRrx0DLv2QFUJWYmtnh5QZXd
	43vCOPdp9M/BzHTfa0nyZ+Lb1mXILWPsi7vx8IQkkfdz8eWSlLgEfBgKSAWiwcjQmX3B
	NHbmibMpw7KGKWXD940RcVCTLSG2gHmrsyGNmhR91SJei0xGTl4n3chfwW7A/qAw9Pzy
	nZXLIqTSaFbj6+W/zBBi7SdsJ54XbqrScNLyjNiw/3YoAbsuLUP+4y7jk5bqLVYqpcHE
	kWF1OThoiRqQ+st9koa1rx3Rxi7x+ZPXceoWglc+2KhIw6TsGUO9pJLoTVGouREn2Dg5
	RafA==
X-Gm-Message-State: AKaTC02Zt30YyD3/tY+YezRirIXe1yiNYQGt8krKIddn8AF7C8fPRkHQGUSY0hkOvcdLPA==
X-Received: by 10.107.131.195 with SMTP id n64mr6128108ioi.161.1479590230567; 
	Sat, 19 Nov 2016 13:17:10 -0800 (PST)
Received: from [192.168.0.8] (d199-74-164-53.col.wideopenwest.com.
	[74.199.53.164]) by smtp.gmail.com with ESMTPSA id
	x99sm5365039ioi.17.2016.11.19.13.17.09
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Sat, 19 Nov 2016 13:17:09 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <3FA1822E-FBB0-479F-B4D2-46FB62D4A13D@gmail.com>
Content-Transfer-Encoding: 7bit
From: G 3 <programmingkidx@gmail.com>
Date: Sat, 19 Nov 2016 16:17:06 -0500
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.753.1)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::242
Subject: [Qemu-arm] Suggested command-line for ARM
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
Cc: qemu-arm@nongnu.org, qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ptl/Bf0qXHVQ

I tried making a suggested command-line section in your ARM wiki  
page, but my lack of experience with ARM prevents me from testing it.  
What do you think of this as the suggested command-line for qemu- 
system-aarch64:

qemu-system-aarch64 -m <memory size> -M <machine name> -drive  
if=none,file=<hard drive file name>,id=hd0 -device virtio-blk- 
device,drive=hd0 -netdev type=tap,id=net0 -device virtio-net- 
device,netdev=net0

If you know of a better one, please let me know. 
