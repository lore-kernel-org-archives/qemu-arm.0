Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp682350wrt;
        Fri, 4 Jan 2019 06:50:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VeUdaUYSJFzxvH1yvZF4UczdnQd6jxze07YuSi4TaLPQNpawhEvlM1y4W85tviTYu5/AwP
X-Received: by 2002:ac8:dc5:: with SMTP id t5mr48696841qti.80.1546613441379;
        Fri, 04 Jan 2019 06:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546613441; cv=none;
        d=google.com; s=arc-20160816;
        b=Ll3aQ//LLbHqVkHF6eWaZ0qEFwGp8hhoExTLg0m7v5g8LzgS4/BKSM9k9woNH4mAd+
         jzI3XREya6yGWIvQOENTG6PZaITMdqxCBPmzVqELdAZipU8s9jEYKB5ACcaRSmP6oGK9
         uyUoJaWEMyJiqlY/M3i9O+DFiLcHA2bAZglWenIfhalL0wObfoz5GvJLRI0J+6kn8BsA
         zmV+icQl+FcTLTvYPPRvXWQ5ha1cOAMMfN8wyA90MAwfHdsG1I5ZZOwT81MzRHdgc7hA
         QQ+0lqq+0eQXMoOeaL5pIFB5+slLgcbdvdEiVpeKwZ6tMRAFU948kZaiJxJmo2TCRlgA
         ohXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=8r96HUAxK9l0LtrrF1BLqhlMVgiHZXEjOYg+Ln/WEeQ=;
        b=q7aPJKHp7GT5zSmL0TEszgZu+qnaLOjlmls7YWmX5LSJUg8msVrkV8iOSIbUiST9px
         XOqWMAxC86GnufY46r3uxwqB4a2cTdzyMIlMwewDw2Z/4H9MkdQxCowZB34GbXsTPcXt
         TWXWriRzME7qgyWFWXXU8s80Gg9xRVktXRgLmtNdmDH4agEDE/BVaeTECojkgfFfs7sQ
         cVAFpiCoSK/sWh+4hLhGay2F0s5WtLKC4cTVch2r743dyzBusMsTdea231SlqkdGWNhg
         NWM6PcsapM75wjodztyPUEaMndu3/OWFZiQv7KFYi6r9/+QhJHh9xb6dWwuXoSpt/giM
         Xhug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AQhcd6FA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e91si3697248qtd.368.2019.01.04.06.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AQhcd6FA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQo4-0001hT-UP
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:50:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfQnp-0001gh-Vx
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 09:50:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfQnm-0007Fe-TI
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 09:50:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gfQnm-0007CD-JX
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 09:50:22 -0500
Received: by mail-wr1-x441.google.com with SMTP id c14so36875248wrr.0
	for <qemu-arm@nongnu.org>; Fri, 04 Jan 2019 06:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8r96HUAxK9l0LtrrF1BLqhlMVgiHZXEjOYg+Ln/WEeQ=;
	b=AQhcd6FARyCMS4qTxW3rvftGEuXtpQyMS8fYLP15jc9PJ/FXurypEoh7Km35Vx73YA
	h8w96Xa3WilNRdiUdAYbeCWl+0CHAZvA2MmNdncHqu1lhn3ksB54uBkruyh+WFT34P4b
	LGyN+coEQmXBFBApPEOPGZYeheBeOq9G4KEII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8r96HUAxK9l0LtrrF1BLqhlMVgiHZXEjOYg+Ln/WEeQ=;
	b=HH9IDPwYNjGqGCr+vKc9Bj6mUolVXnBGbzYTmBS0Z0/394Ara/cawHo1JoWXb8oAy4
	r1Feebdrp4Ws3fuGuwgfGtm8FAhVnhBvbxRGA7chIbrGfYJwunzNlOKjsVp/2hbIAyDs
	smThXNGB36T2DFWnpX8OBw0jeqaI9NnNRY/6aKz412HFPTA8YYqQOK8RoAbVt+bNc0xV
	z8i0wB4wZ8bWwyGDHAyIGwQmTFujJlBaw7uAr3BBuhHFbgi7HxeHjU/312oAGgk2IMfO
	oz6S2tw22h3QZfl4Qb82Mv8y2kR9C3WTmTiQ0QOCfaXuQiWBhFeS+b7SdXaCBUm39pOs
	IG3w==
X-Gm-Message-State: AJcUukfZBvGy5ykINwQZW7wll0LQxQFNok7lElZrImQzirD/ss/cJwJK
	VN/l8OaY3dOhi9q/nSeFc/ZPubzqOTMUgw==
X-Received: by 2002:adf:d112:: with SMTP id a18mr46669041wri.17.1546613421297; 
	Fri, 04 Jan 2019 06:50:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id a62sm926540wmf.47.2019.01.04.06.50.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Jan 2019 06:50:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Jan 2019 14:50:18 +0000
Message-Id: <20190104145018.16950-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH] tests/hexloader-test: Don't pass -nographic to
 the QEMU under test
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Su Hang <suhang16@mails.ucas.ac.cn>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rbFk/bU9yl/K

The hexloader test invokes QEMU with the -nographic argument. This
is unnecessary, because the qtest_initf() function will pass it
-display none, which suffices to disable the graphical window.
It also means that the QEMU process will make the stdin/stdout
O_NONBLOCK. Since O_NONBLOCK is not per-file descriptor but per
"file description", this non-blocking behaviour is then shared
with any other process that's using the stdin/stdout of the
'make check' run, including make itself. This can result in make
falling over with "make: write error: stdout" because it got
an unexpected EINTR trying to write output messages to the terminal.
This is particularly noticable if running 'make check' in a loop with
  while make check; do true; done
(It does not affect single make check runs so much because the
shell will remove the O_NONBLOCK status before it reads the
terminal for interactive input.)

Remove the unwanted -nographic argument.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This seems to be sufficient to resolve my "make falls over"
issues with the current test harness and a build done for
arm targets; I haven't checked whether other test cases which
are specific to other target architectures might have similar
accidental O_NONBLOCK behaviour.

 tests/hexloader-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/hexloader-test.c b/tests/hexloader-test.c
index 834ed52c22b..8b7aa2d72d0 100644
--- a/tests/hexloader-test.c
+++ b/tests/hexloader-test.c
@@ -23,7 +23,7 @@ static void hex_loader_test(void)
     const unsigned int base_addr = 0x00010000;
 
     QTestState *s = qtest_initf(
-        "-M vexpress-a9 -nographic -device loader,file=tests/data/hex-loader/test.hex");
+        "-M vexpress-a9 -device loader,file=tests/data/hex-loader/test.hex");
 
     for (i = 0; i < 256; ++i) {
         uint8_t val = qtest_readb(s, base_addr + i);
-- 
2.19.2

