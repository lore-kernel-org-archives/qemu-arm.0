Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4181503wru;
        Mon, 30 Jul 2018 13:27:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcISFrkuGF0JFWMrzzN8R5fv/3oF44CC8K+J/Jx3QnzBUd61Zj+GKYoDeQv8yo1pw6DE6I0
X-Received: by 2002:ac8:290a:: with SMTP id y10-v6mr9570066qty.42.1532982420963;
        Mon, 30 Jul 2018 13:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532982420; cv=none;
        d=google.com; s=arc-20160816;
        b=o9TNcIZd5FMjOu2dkq6klpwC0jULqWyiHKt00c0zZTGC2pi7Ms8DMT5oDvi0RSxzQd
         WlDdH9RKqtUIU8dN1Wb5wXgxJmr7oAU1B61LsKoWgcKI4dmg1J4dR9+WA15JdIb1KvlQ
         tB6TJFEDHH9I9SwzauMaNBl52bzLlYBkV6c2vwV9PwuvSxYgd+ReF53gCK+JEzbXpCZr
         1V2uXb1L8G3gt00AJejFvM3f3ww2ij3gaVoaaDZSLs1aPBr6CHHjk1V7J0t41utA+Yob
         AfvPdYHxLOXT+gfydgm7ejvTHIC/ir7JwGTaG47I60F5C5GGW6PQYeKXV/H/sSuvtgQ2
         J1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=gZqYn2mtNLj2Gob8wRxKbogssZOeYnup37a/AwAaVx4=;
        b=jdbnB2jSb93FI3c74cu5tnhwK7illMSGWEvgBa4gl97CPPS9TtJXX4H57SNBLCdhG9
         qsRGC7KN72Fhl6ZxoMqcbp65n+8k5/5/ZAYIBmRLnKreeuT5ACKgRoHY0ICxiTkrdoqn
         mHpx6+9hMNa0vF0QWqqy983lyP/dUSTqhEb0gQT+XXt3Y5rM823gSys4pgJJdNYm15ja
         aKC3QXXESKMz2U385FkmkU3rTERkrKZcW1u9Zn++p5dQdschjW8WmwuFN5BzWjveINWW
         DP+kwTGr8w8QWQcP399JlyAl9POUVVrV1czOowccqabxd/fH5LhVptvKn+2H4InMjEQ2
         zSqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tubIjLVM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w32-v6si7083263qtc.338.2018.07.30.13.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 13:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tubIjLVM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkEku-0005l0-CU
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 16:27:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkEkh-0005jk-Va
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 16:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkEkh-0000W9-8P
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 16:26:47 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:36536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkEkf-0000Tb-Gi; Mon, 30 Jul 2018 16:26:45 -0400
Received: by mail-qt0-x22c.google.com with SMTP id t5-v6so13574598qtn.3;
	Mon, 30 Jul 2018 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=gZqYn2mtNLj2Gob8wRxKbogssZOeYnup37a/AwAaVx4=;
	b=tubIjLVMLTchLvAYPZZC24X9NUru5fKCv3Cq0XPvV8rQPXnEE/XLFRKBdKU51/avSg
	HVRJGoyGTQciMDMVB9V1lbKah7xq8kQszR08KNaAgLSwDi++ZaNE6ijw1FJIF5LvJZc+
	73e3WnPmwNeU84C2kLr7+4y8FEn6VUSlZrLmo83LPnXLoZ2yaIo05g+0ZVu5uKNPXFq4
	i131BH98z7w7iXMifMSWEZcI1P89X/0+VZfzeTviKsZIYjgS4Hs14ZwLn12KqK6Jd2/M
	dyrCPLzoQqoiSO2OsB8zqb9rI0ZC2YxWU3dO27QrB+c+pH26uT388KaEJM4+IjCOycOX
	nRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=gZqYn2mtNLj2Gob8wRxKbogssZOeYnup37a/AwAaVx4=;
	b=eiLzH4Q5uOXy3BEbXz+37wCiZYurhret8oCKP3jGE7xFn2R4ICjgwtrW28o72kpd9V
	C+LbDCtFnOJRluTsJowZtg76f9saxlhebNJWkM6ZmZHlPQ69ttBEcBA3tsrHgnlIF2ho
	DZfkboVFhClHy1xit3wPuJfNduGMk8U1FhqTOYuCCbMALmxlLUi4BJYrA3Vz9vYSb233
	z7NA8OCEpqK5tS/H+JiCagPw+7C8jQ20ngOWBQ7DSiOxP6CAIrNGBrt/zovP5rzPgUy5
	NBb4m9/D40229iS+HjawwsIXc3RprPavY9GN4fAk5eIsilp7xDMCiL3mr0kD7OPJa87p
	U+TA==
X-Gm-Message-State: AOUpUlH3nw7y2YP4gnnWIfASUb08iJWyVn4HpOn0R8x9Zjz3pqMUYbYM
	OLl9ZaJQLKWAeN2ESFoK0TcLQfYGaO2nghv0z7k=
X-Received: by 2002:ac8:6790:: with SMTP id
	b16-v6mr18789993qtp.66.1532982404825; 
	Mon, 30 Jul 2018 13:26:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 13:26:44
	-0700 (PDT)
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 30 Jul 2018 22:26:44 +0200
Message-ID: <CABoDooPN3LASO-0FVm_shUg3QwQKmCaEfWnuPBS6BOABGr+STw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: [Qemu-arm] ARM: SVE issue in saturated subtraction
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
X-TUID: T6BnBwGgeqc3

Hello Richard,

the signed overflow computation for 64-bit saturated subtraction in
do_sat_addsub_64 looks wrong:  I think the second xor should use t1
instead of t0.

Thanks,

Laurent
