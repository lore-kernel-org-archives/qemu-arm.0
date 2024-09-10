Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1163536njb;
        Mon, 9 Sep 2024 23:12:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaWB64jNQPIpn2DQYjeyiQEyw6gy19qf5qqrRGY067BQOcci8gA4kxug3w4oE/lTHxkMOPEHOYpxr4vQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGrdLI26TFZdSaoPuSHBFEW/thqvs+4fMIoUe5/1iIpd1OFa0kKG0+6JzdDMVfDqTZ6KBGn
X-Received: by 2002:a05:622a:8c03:b0:458:253b:4151 with SMTP id d75a77b69052e-458253b4595mr166687081cf.42.1725948765731;
        Mon, 09 Sep 2024 23:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725948765; cv=none;
        d=google.com; s=arc-20240605;
        b=I7QugewkikFf+ngWOwrGzDIjaHj3WPyftpcJC4mneTbqsZbbAIQSH9hRUOwid7H102
         qUknQdDCKJSA8CSCzEfoqTyHfiPqZF5y7h+EpElICHcAlEr9efZBIPvucbzPci8G09eK
         e0Jpddp7YP7tNwfuWHFFskml94T0NUEEwwe+YePiAngEjLwH7Nzz21Wtf0/6IKj9ydSV
         QWSa+bH8QSmlw72dDhhjbXf9fXqVu+++IS3RZM2ueyJ5PZ/OGySzMSntsWuc+Hc7zjmz
         8YJvSytj/ewmVZM0Ct2nHvuKhO0l8VhiLd1EjO0OJkenyZHbAv6HfIMh6U5QXQe51tzk
         Id7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:importance:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=sAuVh62e364zOHPL1/onPJuiI/NNI8J4mnpD2NwKZjw=;
        fh=3EkCcoIvNSwlrASCcvqsZ/s2iF1sUTSne1+2h6/BaUw=;
        b=PV7g1HbIkIJv4ksLJBcdHCQnNHn5QtunC/xrcIn2YX/Jlj4NdtcAIa20m3clW2UhVu
         BtdPdgxnJ4PW+mLB7JO5zeZxxWRw4noWuCbd2n+IHlF3I0Xh+8PUlI/ToaVDivcm54Eg
         QNLHoVaaCd8+VgKqUTzlOJJReo7QPG8/AZdKjMp2/nyvKDSHex1EmVbjA7gRSVa/ueKC
         SMkjpCvF42/pD59/HSgHTuEWzhUjFWPy3yQFkioCpYtQYDYbu8RnKU6Z0tf4+G8pb7RT
         BDxkufP4R2V1SIFrfDcCZNyBcTzL06qyTP4osjvWvcDVaKTJM6oAbPQgafAWnRUhU9Cz
         M1Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=lrq9SGeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=mailbox.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4582fa0254csi42016831cf.673.2024.09.09.23.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 23:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=lrq9SGeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=mailbox.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snu7B-00051f-Np; Tue, 10 Sep 2024 02:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matthias.gruber@mailbox.org>)
 id 1snu78-0004zh-T1
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 02:12:35 -0400
Received: from mout-p-103.mailbox.org ([80.241.56.161])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <matthias.gruber@mailbox.org>)
 id 1snu76-00035z-Ve
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 02:12:34 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4X2tdy472yz9skn
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 08:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1725948742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=sAuVh62e364zOHPL1/onPJuiI/NNI8J4mnpD2NwKZjw=;
 b=lrq9SGeqJH0XKEgH/D39equwYpqHb4GjJRgfLPqRLt5LOJhi8q16wxHQRQ85pSxoMWrNlu
 jzfzg7lml59jhmRvIJzPmbpmQbfJP8GFIBIyON9GuB5ETnyU15B0i/YdKYhIOZ5ulntfHD
 /SSOUkYXbK0jIRmKBo4cuGozEeUduUBBNFDU5VoXfzjt3AJBqVHCi/S+HdPBVjBupB3/eO
 2W2vKDHKLDkxWeO50yL0YBq18qj2QGWJztM+/rhcqn2AH7MjR2x+xkoVPt+arm5RVnU+Uq
 Ddtf2DZxEzZGwgKc8LAcMaFlp3hBKMuD3TI91bWSAFXbjHFBkrDHiiHpDNIr4g==
Date: Tue, 10 Sep 2024 08:12:22 +0200 (CEST)
From: matthias.gruber@mailbox.org
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <417985669.419060.1725948742208@office.mailbox.org>
Subject: [Bug Report] mremap fails with EFAULT if address range overlaps
 with stack guard
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_419059_373035209.1725948742206"
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: dd117ede90f3eeb4f7e
X-MBO-RS-META: kxey5z65oy5xtuhdknq9w4yi6yeg5knr
Received-SPF: pass client-ip=80.241.56.161;
 envelope-from=matthias.gruber@mailbox.org; helo=mout-p-103.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jj79GDhhN0Z8

------=_Part_419059_373035209.1725948742206
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
there is a bug report concerning arm32 in linux-user on x86_64 hosts: https://gitlab.com/qemu-project/qemu/-/issues/1729
 
The issue has quite a history and causes especially problems with alpine linux, as musl relies on the correct behaviour of mremap().
The problem occurs depending on the used memory area and leads to timeouts in many build/testing pipelines.
 
There was a patch proposed https://patchwork.kernel.org/project/qemu-devel/patch/20200305210534.28392-1-tobias.koch@nonterra.com/ but never implemented and finally abandoned. Are there arguments against the proposed patch?
------=_Part_419059_373035209.1725948742206
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div class="default-style"> 
   <div class="default-style">
    Hi,
   </div> 
   <div class="default-style">
    there is a bug report concerning arm32 in linux-user on x86_64 hosts: <a href="https://gitlab.com/qemu-project/qemu/-/issues/1729">https://gitlab.com/qemu-project/qemu/-/issues/1729</a>
   </div> 
   <div class="default-style">
    &nbsp;
   </div> 
   <div class="default-style">
    The issue has quite a history and causes especially problems with alpine linux, as musl relies on the correct behaviour of mremap().
   </div> 
   <div class="default-style">
    The problem occurs depending on the used memory area and leads to timeouts in many build/testing pipelines.
   </div> 
   <div class="default-style">
    &nbsp;
   </div> 
   <div class="default-style">
    There was a patch proposed <a href="https://patchwork.kernel.org/project/qemu-devel/patch/20200305210534.28392-1-tobias.koch@nonterra.com/">https://patchwork.kernel.org/project/qemu-devel/patch/20200305210534.28392-1-tobias.koch@nonterra.com/</a> but never implemented and finally abandoned. Are there arguments against the proposed patch?
   </div> 
  </div>
 </body>
</html>
------=_Part_419059_373035209.1725948742206--
