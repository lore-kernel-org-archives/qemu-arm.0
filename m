Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4987540wru;
        Tue, 31 Jul 2018 06:53:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe9jSaQVj0jFTAeEuI/8q+2qUOuYdOekr2mXHTCfVaSCfP7uBvnziVN7SDemXlC+elLpfic
X-Received: by 2002:a37:5f03:: with SMTP id t3-v6mr20342184qkb.193.1533045190876;
        Tue, 31 Jul 2018 06:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533045190; cv=none;
        d=google.com; s=arc-20160816;
        b=0fE2TntY15RI3Xz8NJKKPqhThuz22dl3KUUZnrMMvftCr+8/KkUlWwCwTzZjWzsO+2
         WQCQb/LgKS/BYDPulYUXgo201UXmu4dbgtkV7jgBjU1rtCYAQ5qR/OD7MmYj5EZ3ZT2C
         vygUMoMR+DCmJc2D+ZdMniL9Ioa7g0YN+pWHRTCdLCzh5+ZZugyazcZZ9TiJXPhX/9Pv
         +1NYCHwa6MOj7Q0RQr6CsoKTI+xpudfxZiADj60FI4MQ5jvF/QhEmKDLSHcl8jA27bc1
         Ewkfl4qqPLRb+wjGRIHTA48m/JvbjG+OHXJVpmroQhDo86VPMTg3cFAm6VnQGH3miQbU
         9neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=W3E8KjTe/uTw2/H9XQQk/vsFbJ1iWOFQjPeaXS7t1Bg=;
        b=NaLP/Z9eQxl5Ec0oXjHKxDCF8KUM1sYuLjaqXSjd6GuJkPGrsGwRlcdoXjylzsRj8m
         Nm8q0SbvgOKa+4mu5WQj8vL03otEFUq6F4teQ6y1vbx33S2GHNxosRNLXmtHZgucjZgk
         4CUd/ezekJz5P4cPBCJhKzAu+FmCBQET0niJXFDnCxUJZzGTgJ63OtBWSloxAgVZIUnk
         wqnPPWm242Sy8NTW1bsLdhY4e/CFNZ7/R3VpmBXufDzLpnyqcY91BfZhbeunfuOk4WJd
         UUZGRQ1zNGCrdQhn6Fk58ob06MjCLOJEgSOC8AK8zv50JkRIflQcGwgHPUXb2oDQoJjY
         kiAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S7m0TL4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n37-v6si1009864qte.352.2018.07.31.06.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jul 2018 06:53:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S7m0TL4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkV5K-0000Cu-Aa
	for alex.bennee@linaro.org; Tue, 31 Jul 2018 09:53:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkV57-0000BB-4C
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 09:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkV56-0001bJ-Fi
	for qemu-arm@nongnu.org; Tue, 31 Jul 2018 09:52:57 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:44757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkV54-0001ac-H4; Tue, 31 Jul 2018 09:52:54 -0400
Received: by mail-qt0-x229.google.com with SMTP id b15-v6so15946148qtp.11;
	Tue, 31 Jul 2018 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=W3E8KjTe/uTw2/H9XQQk/vsFbJ1iWOFQjPeaXS7t1Bg=;
	b=S7m0TL4ZjrYdVX/5R/KvvK6UrKwaqE5bHc6bUGUIj8fd0eqOLEJe3nTaUn8TfDC9h7
	OXAT6YV4SnixMqc6DA9FY6F8KAg5rKCKTag/vqtB0Sda1zv/gQ4PjnHnV1TwbRGCJn/U
	DqfG3nScigGmu22jGOPoxZEavRkYGsxndnbEIA6GvLTG8sqJSvqA5FKzw8bACVGzD8v7
	FvqDsqGz9ynXVWudLFOmZj4Wq6Aqrnv3pR7v3po0Y/9B+VqKFJxtyU4a6L3WoXebaSaJ
	xnpY5v3Dh+lyHzg8qm2+NEDxqXg3TgORyEnddhBCWV47QRJuGu5XhYQzG/Gc7otkf72e
	SbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=W3E8KjTe/uTw2/H9XQQk/vsFbJ1iWOFQjPeaXS7t1Bg=;
	b=YNebcBYYE4lBTod31uAzClryv/lejwzERiiL1NrE8K4uUFnnPU5+Z/A7uPWgoTz3Is
	9FYnF/rSi4o1mHhJqnT08IMQYtao5H7XBxUvMbsApWm80qz9a/2QH7HVdMb0YsZx1Cqv
	WNiDwzqSrit62zjksFDHRx6940eTAXb9V2DUpeE/nevKEo/30m0lTUiR3CnOkCcdvy30
	+POtEmwnkhtgXe4Fc//V/f448RCquA3TCoake8S7erPf8WoQyoRYI6yUbarElTz+S6NZ
	cBEwxCJQpL/P7eNDcp3T6ZOHPvSqbpaRfjSlHYL9+j9uIoKKp6cRIjOrKa1JGM0Mv9z0
	70LQ==
X-Gm-Message-State: AOUpUlFWj5VigJpyZJQbeN2l4DyR95VtMdcgXsXJAu69LTubZLA5K0E2
	6jk7kqFYBPiqizsRDmpc28En2Bd6K3yzM3nmHLU=
X-Received: by 2002:ac8:6790:: with SMTP id
	b16-v6mr21670617qtp.66.1533045173691; 
	Tue, 31 Jul 2018 06:52:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 06:52:53
	-0700 (PDT)
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 31 Jul 2018 15:52:53 +0200
Message-ID: <CABoDooME+KJVWJQcodVC-Mo2qpZhmYA3LVBLQcTj88qW1i5h5g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-arm] ARM: SVE while issue
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rldgQZFGn52q

Hello Richard,

according to SVE specification, whilels/whilele instructions have a
special case where if the second operand is the maximum (un)signed
integer then the result is an all-true predicate.  The current code in
trans_WHILE doesn't seem to capture that requirement.  I'm afraid the
fix won't be as trivial as for the other two bugs I reported :-)

Thanks,

Laurent
