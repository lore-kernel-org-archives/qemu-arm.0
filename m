Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1F8CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:37:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDPY-00041D-Td; Mon, 28 Sep 2026 11:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDPV-0003zz-Rg
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:36:57 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDPU-00046U-E0
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:36:57 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab2029eso2761791d50.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790609815; cv=none;
 d=google.com; s=arc-20260327;
 b=PtHxU0gwKJJaR8g4Dkq24ubU5wJMQACnf+EeyjMsLuo6JCfACWbAjTGjRMw0+4NnBw
 xOvWqF8NlWOR6RDqMQ5CizbpL2lD5ugGjmWyrn8C3iHS7h/wLSitO3dSB3ea9eOk3cqS
 4NPjsaPW0Z/KCGqrhTgi538PMAhSMpKNgza6LDQtf20sc7qswoKyyjahxgu0Zavkgmth
 JkFcRBWcdDOgUlB/c3Z5DlGLySDpzJ95XUvJMKyLCWZa6kgkF22hk/mtv82lIBf3+MAp
 f3FWN4ngA39BjWuMogumhR+37bINA2sXYcbkka9BQNY861+rT2Eww/O2QWYu1ddVTTJz
 zMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5a5z5TBdzXzcWjaqRCZjk3mWtpgfot9Ir2y5mBBuiqk=;
 fh=ArMwU+qlDWpIhywfX/l0DrqC5UqK7rubmJLMCb7NcsM=;
 b=GL2qOhzmzW5UiI6w1lA8KP6l+Rvjq40JRcYVJf8fzNvFLznnwVHtN4qUfSEH9kRZv7
 yakfRP4wsf3j9uVFp00jrLd9KxWq9+kT3KutJHFJLrzTPiUuD6Xpd/oqPkfxsM5GtuEC
 +s5EUpRz6CQn/Sz0HjQqVcIuAN18eqE3dyZgQu9bYFfXm1EbyL0LTkZ4ur4rmUlZMQal
 hPilgD/yLRNV84wWNh7aDUI10Z/fCGSoU392YbXzMP14DE5qlof05FpLUpt9xBh593tI
 XpDx57UDvNAj1m2KuEPZiDgcqeo/Z2F6j8suREMouZ2HnRplvIvO5GZ3JFWVhDYjMZs4
 hPqg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790609815; x=1791214615; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5a5z5TBdzXzcWjaqRCZjk3mWtpgfot9Ir2y5mBBuiqk=;
 b=Qz8wI8vE8sN2X44StpvvY/CCGXmFQ7sp+avg9FQV39usla8hmtQvQAPQjbQMAv4DYg
 rxDdcqitfl0c5CTwbtyr86tbR0gfYkBphnvwBXIdtlK/PC0emqnG+YH9ROgEs/tZeGW6
 ARtBCLu+F4afQ/VNe/uB80XStoHqo8EdaFYn984BL5XjPvTVR4ILKG54QosJNTuk6IqY
 dkr5Q7WhkYW0KEgWj2Ro6iCFTsoaxZ1EZ/BFbyrzHa6L1Rnbqsg4hb+P1+NmAzbOgpLK
 0pek9F9h5IO1/AHT9Ebgjw5uYYYtVZrA9I0EdwBZPMGkIW4pPL9uNdBahvkQ6Qi8VAem
 sk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790609815; x=1791214615;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5a5z5TBdzXzcWjaqRCZjk3mWtpgfot9Ir2y5mBBuiqk=;
 b=K9nyp6jJWhl0XnJ7A4MiC+vJYy0G4Ml2T5/xGDFJ7fDT60hww/LkRazGelzt5lPWLr
 JsDSa9Dvn6OfMX5E5TSUbJ41YoO39TZOgro++dHCCGxlwvVg+bqqkmcPToEwxx54SbIz
 qrWss0//4gtwsoUqR5UrteornpxNKDY6PgqeQngj+BzGsFPTiseYh1HqrBaxQQibGVmJ
 E6O//u7dz0hbdogeP3hvbD65KEAyWz7D9nw9A7ugAL9SLrnc21FfscMKE4IdbsmlmQv4
 bSUOY4w2m0dgNKD4LbdIXrJxrtsaX9jYZKqjI4tOQ8iH9vt+pNnTGzS2Z+eS5OACpacV
 wbpQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbM2czDD0ks24pW4b1A/cOyfiTZ4Zg0ZBvTCu4jYrQoLHCJlRgrkjDTpbDEycF4JMspM+TYevXBQ==@nongnu.org
X-Gm-Message-State: AFuF++lPaVEQMj6JP54RbGJqj0oWB1WUzDVq2Bjvr0h1UkQIxSSwth6b
 y/6eXm67XChQTdOmfn2IYWKbevciwnP0RNRCEXrNrK9axvZFFH6PSmNTlNEtDPOaJ49I4yOPS/i
 b46FJIn5cf1Ca2xqe2NjmJHRX++1VGkeLWerB1dTXOg==
X-Gm-Gg: AYBFou1YypjBUScWVeiEcSUIOlM863flhROW9prjx9JPZdIitQ/BRtEfTEeITmHWIbp
 kybDcriiYj27KDdzl1S133ECZs2g8Fme47vOtEyH5wdhkCANXAbvV0py+P0HUqTG6VCffH9JBzj
 3Lp+yKgokgyUbKfexTc7Y8/C5IjMLTcZZzTV5QZJhBjSU91gHShVRqJPui11GqH8Jo/HYVnBIpy
 9H46+61bU8fjcKoJJ7Oo3E9fKkN3S76qllMVrkFCTgCSM3YuqEE5LLSLcsWK3n1pErqvOZDf4cL
 4WFY6SiVopNzJNrJteDLSOv6R+aDsF4rVfnk8zccPlcQMFeIxYpV/8YLk1DwjRISlYa4E9kiyjM
 lPnR18gvzEEzn4w7UyuLAm/wcqExH7VzgTGbjm9sr
X-Received: by 2002:a05:690e:1343:b0:672:99e1:11f4 with SMTP id
 956f58d0204a3-672ed523ab0mr4214756d50.145.1790609814986; Mon, 28 Sep 2026
 08:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-3-richard.henderson@linaro.org>
In-Reply-To: <20260925215004.456336-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 16:36:43 +0100
X-Gm-Features: AclHuK-Sdmn0RY5k6jbxbp8w59rVdx46jmoMyGCQDJ0eIwwh3bSZl5tErGC-CxM
Message-ID: <CAFEAcA-C=1FH9jf=qqjK76Eoy41aGgg=Cy=weVcqBa1C_RWtBA@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] target/arm: Reorg rebuild_hflags_common*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 25 Sept 2026 at 22:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Invert the call ordering of rebuild_hflags_common_32 and
> rebuild_hflags_common vs the rest of the flags setting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

We do have "set a TB flag and then later in the hflags calculation
functions read it back" dependencies in a couple of places:
UNPRIV, ATA, FGT_ACTIVE, PSTATE_SM -- but in all four cases
these flags are both set and read inside rebuild_hflags_a64(),
so reordering whether we do the common flags first or last
doesn't move the "read" before the "set", so it's OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

