Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp888207lfa;
        Thu, 29 Oct 2020 13:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwan4dBlpHUO47Kutrzwvr0PQ1ht8SkhzrqrpvcVDthV+D6sl8SRpw4lIcoXvtkN4tn3+Oo
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr9323825ybh.398.1604003224227;
        Thu, 29 Oct 2020 13:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604003224; cv=none;
        d=google.com; s=arc-20160816;
        b=oY2Ka9Wkon3NuzBNQThuT+/W16sVvo2jCYfM1mmXRtTAiBFQ8BIAVsAbmobIgvZaQ6
         VChaaOIwspAI5fMtun7UqPYwBQdRceClKls8FoY/QRZRzWBvY20m2aaLyQcRF0fB/hOx
         YQI+vYt+SWbF+l8uUnsUHFGucFWuTr7G/HoLr98DSuGDwXz1xDmzboQYDaXcNhvMwVvk
         dqLYvQcx79WRrGJYNe+wsGFnLBcFzww622eNZlMZNPdfpBRNBHbOkX+C9rxtW1TESXHN
         L2IVIf2XWAUgAXYiIyPkb1i0lZrnd4dTbLTTv0vS8gxnQi7sWxjDNYRMk9YzoHZhgEe1
         Yjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=DCmsmy6/kBRKcYfhpaniuSEL0OBmavrEMVjPR6DNfJs=;
        b=hup5dftOWu52Vw6cwNM8g96NPLHaI4i00ltIPBw5NYOCaf8Wrn/hZpK91Q4EOOK3Kz
         Viux0VfBnBgWijPECr+ASU5ckUXV07dA0qY31leGj1H5OSezRz47PKZOKVqDwMXx0Xol
         iJo4ItfMWQMOwZlPspOXx5epjhMwh87A08vwxfF0o3nLt2owha2I9lIXMhl8bt9YxxNe
         XFL9Z5l0WP37Yxa//kD3vMrK/9PLq4evmvgH7H/d+EbeOUVJy24Sx0/PUAXwh0FpECbp
         HnShI9bzIiOmuIfZ+yF3vHsMk5OzZ/D3xvBNurxgttXfU2LSNBpnrLRfeO7v4ndWmZls
         ysLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si3939935ybq.58.2020.10.29.13.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 13:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYEVj-0001hQ-LJ
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 16:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1kYEVb-0001fZ-TY
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:26:55 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48128
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1kYEVa-0003Fr-2Y
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:26:55 -0400
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 0D3915FC12
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2020 21:26:53 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/1] target/arm: fix LORID_EL1 access check
Date: Thu, 29 Oct 2020 22:26:52 +0200
Message-ID: <1761791.tdWV9SEqCh@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20201029202506.9209-1-remi@remlab.net>
References: <20201029202506.9209-1-remi@remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 16:22:01
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sMUA5ECOIbwO

Woops sorry for the dup.

(If there are any mails from me in the approval queue, admin is welcome to=
=20
discard them.)

=2D-=20
R=C3=A9mi Denis-Courmont
http://www.remlab.net/



