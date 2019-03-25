Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711859wrx;
        Mon, 25 Mar 2019 04:03:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUCnrWY4MFtn5VtWc9+alM0VkFn9Cc2XY6yRphhrTbyx6f8bGiAub6P6JSI4zgqOtMkOLz
X-Received: by 2002:a81:148c:: with SMTP id 134mr19960248ywu.217.1553511802667;
        Mon, 25 Mar 2019 04:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511802; cv=none;
        d=google.com; s=arc-20160816;
        b=t/O6fXEoEGRcT3GJszsGBeFDnhjglBDhpCSOCC9uurQQcpNQKjX5pXMlko3XO+yzX3
         rrWW9Sw/jkGDKS86YuVhtX+QxpGt81Fx5EvNe0YbgAg5lWPW977QGg6XJWedw+kMNLEn
         XmwTocEtz5mPm8jvShRSpwk3AlnS5kX9fa84vXV2Egan39GqQ6UK5khW9ff17whxJYmn
         +YFvbnq/pDLd5Kt0KQ7KSN+K7V1v7F3d1W/1YZU3CAR44uIFvx5DGifwti8SdV7BGyn2
         0LwgipcYXEsN2Q74DembgAz0/+pciWgKSnO8fSEDJHG3mUw6UGKt9XyA9LO7GDPRykNe
         Uwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=IzACfEPyovd3B4z+jsA9wXDbGIv3fzKeJcb419LTjew=;
        b=j7K39yL6BSvhxSkv1VfIx533rra0HyvbT1C/tlStIbAlXOodCinBTctfyPDmQqd7I1
         kWVClu9Y8m6xTZUlAuK5sqaDfH7nF1VCcF3mZOuHhRHcpeChf8+xWeHZt+dcytFWcW0W
         0ucpx9GTk6NrJI+vlHoDupXeBkmWYXazWdWQvxApzmmpOuMBghiflpta8BwBDwnhQnZk
         ompZFKQeTWRa8beobrsEveUCQKepRDWDZwEjBeGdvPw9OkhmpCDm2Tj91wicf13rX1wt
         pxUv6NXBk5gFZ5Q8IkCsTPnDwGdlCdF5gqiioPCX2V1P+13v5xDgJosQjUEMevIG5ws8
         2xTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="NhiOE/yi";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pJNht8DO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hzieZBGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a145si4606562ywe.149.2019.03.25.04.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="NhiOE/yi";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pJNht8DO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hzieZBGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNy-0005TR-4y
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNE-00059P-OP
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-0007pX-Ak
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:36 -0400
Received: from greensocs.com ([193.104.36.180]:38357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN8-0007oV-PZ; Mon, 25 Mar 2019 07:02:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7C7707D78B9;
	Mon, 25 Mar 2019 12:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511749;
	bh=c3E94xCsfOaStIii3Bzkuh1u0yl828DPLI2z6qU2fU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NhiOE/yizjVgQ6d2v/hOFucLrzcSOpanwbZywf3K86jHYb0YT+N8WzSYNeoNDjgP8
	ZaaHVnbLu8Cc7UeO9J68p3mimYkvqWhKKH9NYy8SbcHAQUNAQBBQdlwl+ii55p9OJ+
	wSaehJ/LV/TMYt4XrxeKhLF4UClSgzfWKE8Zvq4Q=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pJNht8DO;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=hzieZBGJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4Wb0bJ-1PfI; Mon, 25 Mar 2019 12:02:28 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 091847D78A5; Mon, 25 Mar 2019 12:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511748;
	bh=c3E94xCsfOaStIii3Bzkuh1u0yl828DPLI2z6qU2fU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pJNht8DOEMzozsSthTDqf9Yv+cevwWiSy9PYfVP9Qxs/3GLU/lMwRR4rrnEp2mpsS
	fd7pG2ERfZGMagU1fOhf1v7BDdHw5ABZqOiwm4ye5GEFeqRlgfL0HnE2eVl9SaO36/
	lc0t+yqKMJ9XaDfpUOI1rnik4Gqy1bDPmSBMCuGQ=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E3C8C7D78A0;
	Mon, 25 Mar 2019 12:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511747;
	bh=c3E94xCsfOaStIii3Bzkuh1u0yl828DPLI2z6qU2fU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hzieZBGJA2wce4/bj/5NtWVzuyASvmLmrE1cgFfPqKr8xc3PbRpLBH3VjNOKzyDsK
	/wddgD8JGjI7zfoPq/7N4g+0gVoXB5QMsYZUzGj6rz3E2k1Zp/DHlGZfbCgKlsHZ9C
	JipK+GaqPyZ4mlg00xce3We+gNro9Xmu5BTenXt0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:53 +0100
Message-Id: <df60c0324216bd92d46bb859b21dd4965d7a2af2.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 10/17] Delete the system ResetDomain at the
 end of emulation
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NBDPy3j9f0U3

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index d61d5604e5..cf081d5264 100644
--- a/vl.c
+++ b/vl.c
@@ -4611,6 +4611,7 @@ int main(int argc, char **argv, char **envp)
     monitor_cleanup();
     qemu_chr_cleanup();
     user_creatable_cleanup();
+    qemu_delete_system_reset_domain();
     /* TODO: unref root container, check all devices are ok */
=20
     return 0;
--=20
2.21.0

