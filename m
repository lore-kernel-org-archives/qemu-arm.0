Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp813547wrh;
        Sat, 4 May 2019 13:42:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzephpfqtjLsEFEPXI5iTVRuQGPPw30rrcy3KFfTZKzpJmFohFiLQJCvJZ3h0M8MoGR+eP
X-Received: by 2002:a7b:c053:: with SMTP id u19mr10689414wmc.63.1557002521635;
        Sat, 04 May 2019 13:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557002521; cv=none;
        d=google.com; s=arc-20160816;
        b=yX7njJ/SWXXhhwKYg1XQht23B0CuEsnM8HXq7NPgYomLEvTShuXrYzNWJY3Hm0HL5K
         Q6qWMjFXnpjDnGruxVDtvJfoxbxzIyN7zmz6VvzsrbFRFKhFu1Cp/hBjsz56oA8mwXGr
         FTj6BkMswyqm17+Dd95u13ujd5Q9ta3milqSW2MEItknzzJ1H4CEeLjNK8vFXW7UYlqF
         ehM17UpjrBIM2pUsah3Mlu6jdlKBlo6kfk8cRh7KoFffSpB9T5rnlW2D/kZ8ifGyqOj5
         enR1qEaTiLhf+Zne1NH0PyJe42kz1jaKE43NNBQXpZf8wrKdzLtZaMFLUTTLHQ0bd019
         YzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=ryhxecakm6v7Y0PaMs8toL/sSCj0wnID2RByjmkFk50=;
        b=jqPT/zTMnfFI9tAYgGPAyssKwv9+BKJueOb5MByBRHzB1Pd0HSVQ9B40378qCEVi2S
         CR8ZVaCQXkM71xg/q0i+ULH7Ds5db82nb61IYlIk3VRXL5rZpXI1EPFu9eUJYjbn20Ym
         cA2PMpD9lQ8ggJ6nfNnAHzfzlxdr9oquABZlptqCfXSD0egCSdQUOFTc0ByTwIfrSe9F
         g8syybrB9sjU8bH7+fju9oJ1UcsNgV2z25FiEYsF5zpLbWP8QtHfruA+W940PBqwZ7Fj
         4oZk9qSpooVKWKGLWxyDIfzmeS+/2ZY6MCriV3fkt3XipSEloIb8k+wh/WQlZxgsMIHZ
         h5vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BqCymeJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si4373177wrs.184.2019.05.04.13.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 May 2019 13:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BqCymeJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:60880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hN1Ts-0007Ei-OR
	for alex.bennee@linaro.org; Sat, 04 May 2019 16:42:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas2025@gmail.com>) id 1hMx2Y-0002QU-6h
	for qemu-arm@nongnu.org; Sat, 04 May 2019 11:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas2025@gmail.com>) id 1hMx2X-00009c-9g
	for qemu-arm@nongnu.org; Sat, 04 May 2019 11:57:30 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andreas2025@gmail.com>)
	id 1hMx2X-00009S-5K
	for qemu-arm@nongnu.org; Sat, 04 May 2019 11:57:29 -0400
Received: by mail-ot1-x332.google.com with SMTP id e108so7927252ote.10
	for <qemu-arm@nongnu.org>; Sat, 04 May 2019 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ryhxecakm6v7Y0PaMs8toL/sSCj0wnID2RByjmkFk50=;
	b=BqCymeJZjAZy8JuHX425MOdPFNI2gwSkcJMyLMZUpQRPzcxWlNu+ubfL5adrLbyUyZ
	apl2BRq/OAsbD8KAvOljY5L5TidPgzsOuuAqIo3trnNBklWz7bOZHjWm1h9CTgy5hkEz
	D8OcIcTs8dA+FLJHfK/AzyTcmiYemhPEcOCPbwQDLQlMJ2kpnZ6zH0c12q/aJFktfcPX
	mkMEui2RC/31ASpgu6pkBFdLd1xjln/xiDovbjO7KUih7lO6OUirS50BiQ3kGuEWSkss
	dT3CeNUp52G5t8pG1PANT8p1NsAmxRp3XrApwz5nIkGECjdBKHpe5ObLEcn+5Bs/LFmU
	hafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ryhxecakm6v7Y0PaMs8toL/sSCj0wnID2RByjmkFk50=;
	b=PyGMkHvDIyi9Gx/ZcY/QoGHXtjvcSnTP5NR0AgM2MSpUewKZbkZYQehVvTREivEm/y
	Qut7nVtfwR8uZ6E5CyIuMzJnzEupgjcUGMd1fUtSrm1l/9ngU4q5jznAou8uwXabk7Rk
	zAEb3fppOupFrbJ0JJo193n3lSYVhqvXIFA1Py6nHq4mZkpB6hHrTTCSrlK6m8Ok8duV
	9AkQeYOfgsWKZOuInNzkv8N0tMm66nGgU4J/XIzp5+diVk4BkP3LYDYfDFkYEQWNQ0De
	7an5+OxV/8b/NBzbPAc4pFZFojrz18tD+IDcbTpvdmN0DT0klLnxZbjl0bIwp49ITIZv
	D+7g==
X-Gm-Message-State: APjAAAVl71dVyNzPfoLN7KqFSS/h4kr2vzgOE9kHchOqrTQWYQYBKfpX
	lyNoANZIrvUe0QkrnnZuIDoNL6mPnhLNtvZrIbGvqqkP
X-Received: by 2002:a9d:67c4:: with SMTP id c4mr10411163otn.215.1556985447526; 
	Sat, 04 May 2019 08:57:27 -0700 (PDT)
MIME-Version: 1.0
From: Andy Ng <andreas2025@gmail.com>
Date: Sat, 4 May 2019 16:57:16 +0100
Message-ID: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::332
X-Mailman-Approved-At: Sat, 04 May 2019 16:41:19 -0400
Subject: [Qemu-arm] qemu-system-arm with GPU support for QT with OpenGL on
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
X-TUID: Po+gRn8Hk8w7

Hello List!

I try make a cortex-A9  with a QT 5.6 application that needs OpenGL to
run on qemu-system-arm. The real system is a IMX6 SOLO SOC with a
cortex-A9. I have tried and built different versions of qemu and have
activated virtio-gpu, virglrenderer. The Qt application needs to work
with DRM and GPU, on the system I am using etnaviv. Just for the
information the kernel version I am using is 4.9.x

I have tried to create Cortex-A9 images based on vexpress, however
qemu will complain about the PCI. I have tried to use -M virt, but
this one brings up cortex-A15, compatibility issue.

I had QT apps running on qemu-system-arm in the past but no need for
OpenGL, GPU, DRM .KMS

I have searched on-line for some but could't find some that
combination of working parameters.

Any ideas what would it be the best way forward to make it run on
Qemu?   Do you know what is the best -M type that I have to use.
realview-pbx-a9 ? I do not want to recompile the code in different
architecture of CPU model.

Maybe there is a different approach to do all that, qemu-user?

Thank you.
Andy
