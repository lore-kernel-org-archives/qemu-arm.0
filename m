Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3835961wru;
        Mon, 30 Jul 2018 07:22:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdBdH45KEmOePCd4yzJgKYAbVTFbQasqLrepaX15B19Q0vx+/AVmVSfgRBMGkk3aVYocgip
X-Received: by 2002:aed:3b6a:: with SMTP id q39-v6mr16836200qte.246.1532960541498;
        Mon, 30 Jul 2018 07:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532960541; cv=none;
        d=google.com; s=arc-20160816;
        b=GWcK+UvUX05FLBnPa4gRSBpEIut7ZqJhH+knCfpUYglBfthSY1h+iClxBpA3wYzBoT
         98bJRMn84C59om+htC3tCoqK8m1u6NnTJWiqahIWavzkMfoJRNsw6EgxWNCDG6mZ1tKq
         KBnBJbmkaKSht5xnT8W/eRUWRmrwTnaePTbmjxiGNeCo6etdmA2AtiIqXeqFa6tp1KRO
         1LFeFVWgnkOIxtEvwnnBSk+q2XPnWhJ+RY3lKKEGfgBcfp7YaWzr4U4+X+Uq3tHxrhLe
         AHWisZw3C5jW698qybdCEPU+Zr7uQ9aOXnnsWrxDwTL5NYKJUaV9vN3bZUD8wydlZgtK
         QBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=uDpfFRKiW4wOwfUNytJqZX0OgvKJArzUj6VhS+BT98k=;
        b=IgCMm128HP9C8H0oNt8SN2xQyoPO3Aq++5MHjXRZQ/5ip8svEEnkhdegLzU38C9mer
         unFPjkuagNscO2kPTHTjGgnVxRR5lwOw0S8gCMA0dmAIZoxLr9WENzxMPP44M4UPI0cS
         empYaw9QJnOZb4tHR0Q8vazFffrsvzxZ7hWrCbqNNlgeKa5P6lug8UqlSaXu8ER3UT2i
         ARmF8XuegVNxPlgaxmpLwOAXt0uwPaUiGq5Igqn+rq53UxtEoUimQTFyPcfeozgmQQz3
         QmiUrG+I1O6PXI2oRea8sB9NK1qGFs7SuWzzzb2TLQchuJXZHyf8Px/tWGy9bRpKGKq9
         DN7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YGp5btbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n13-v6si267610qta.189.2018.07.30.07.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 07:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YGp5btbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fk940-0004bG-W1
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 10:22:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fk92a-0003gv-4z
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fk92Z-0004Nn-CQ
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:20:52 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:34267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fk92X-0004M7-DF; Mon, 30 Jul 2018 10:20:49 -0400
Received: by mail-qt0-x230.google.com with SMTP id m13-v6so12224034qth.1;
	Mon, 30 Jul 2018 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=uDpfFRKiW4wOwfUNytJqZX0OgvKJArzUj6VhS+BT98k=;
	b=YGp5btbdEpDlpA45MXyGoa8Jrz1AJcG+3oNTBpBUgC3RbEH5B1XJsFpBiwlDEZ5zYV
	4sdR6AgHdI0rDlwvkXmsQ6pmXdH34qx0yO1v6QwnkQDcKaOMIragmkr3nsW2wnDQqF1b
	akC+o8m8XXRKJnan/55Q/1xvzHUWwQIIiFtoK0OSPDH//5Et7QFx8Bj2vwcohbUEqnFY
	9Dt2+gr5YmKKqoGf7Mm5aY6LsFP0rBwGLZ2yPkdNFYT6oKa3H1BZ/XsnP/WRwtQKvtRy
	M5DfrJMtOY3BAshZrDP4tdwgkqMwvn2wDuAmeDjergUxcOGrgAyXs0xo7e6YdXjOprAe
	qWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=uDpfFRKiW4wOwfUNytJqZX0OgvKJArzUj6VhS+BT98k=;
	b=T07FTPAAzQXBHmUSkJn2EZ0+/2T4mecEnmRLT8N67rlV7UHQQKhWt4wTt9aV8EVBR6
	fKatpCGVVb4UQXeHNGqn/oyRq4CVKbqC7pN3TO2H//YcvYu9bHFSOHy0OLXgH6SQCMLi
	vjw4xr6XvSDzuBJJFGd4vQPexSRUui4QBIgIOe5d3AzTfRgS5NT2QKYaciFq1j8S7q0f
	ajdwKirqfJd+Zt0dOtcYF43PBjnyCpQ7xtXqY0aHQ6lz0R5mWYYBMXU0jcsnZLj+uKud
	c6gnWRi4/v2FUeBbwDWpf76nbojby0+52m/u5bVjWTcRkTmOZp8n0fZMliw1D+FDJD/I
	9RNw==
X-Gm-Message-State: AOUpUlFKUbEjppayLieBcvbbkQQGdn4wvmIYPLUd3mz9yn+gOAL8bazL
	cSsXWYWZ5W210Q+gwskYGkoloXjsGAlZe+8kZSs=
X-Received: by 2002:aed:25a2:: with SMTP id
	x31-v6mr16601073qtc.228.1532960448647; 
	Mon, 30 Jul 2018 07:20:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 07:20:48
	-0700 (PDT)
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 30 Jul 2018 16:20:48 +0200
Message-ID: <CABoDooMqFQz_ssUKxMgxRCArF0dLCAa+=cjY5bqR399ZoHcxvw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-arm] ARM: SVE issue in cmpeq/cmpne
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
X-TUID: AyrjGsDWxj2y

Hello Richard,

According to SVE definition, the operands of cmpeq/cmpne SVE
instructions are signed, so I guess the definitions of
sve_cmpeq_ppzw_[bhs] and sve_cmpne_ppzw_[bhs] should use signed types.
The other cmpcc instructions look good.

Thanks,

Laurent
