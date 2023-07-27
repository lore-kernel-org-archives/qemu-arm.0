Received: by 2002:a05:7022:90b:b0:68:74e2:90e5 with SMTP id bs11csp97594dlb;
        Thu, 27 Jul 2023 14:38:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE6MRUNxlVJcMPv2CmQsi4gnGEQCIiEUTC+GnIdJrWYGWaKxo7f/wD8hObdH9Q4Vs/lEGjv
X-Received: by 2002:a05:620a:85e:b0:769:89df:41a4 with SMTP id u30-20020a05620a085e00b0076989df41a4mr642108qku.71.1690493918945;
        Thu, 27 Jul 2023 14:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690493918; cv=none;
        d=google.com; s=arc-20160816;
        b=Tm7I6jcsSAc9MxqVaRChUmkV99nZMylvFS35CUy75X+xhWvEZiE8pp7kdQFaxFqS6c
         HJYsVNfgPaUJJ9M8KAvyfQ+UgfCJH/me/yhCmgTK1uihe283IZUzsN2rSdGkLlxdXHeW
         ucI2k0Mc5q6bWcqXRTlQ99WRczsaLx6X6pUh0FJV8qyxk/w8SZuu42+IKSl4fJiZpFWf
         O3VWfwTlQC7XMfbC5pOesVjXarLfkZr9JQqUh9crwt0Q+8afKhA5ajHVc5nRbcK3gvKJ
         4V5y/3S9UYenV2eD1z7TKMZFv6xMYPZOM7MC7TmJ/pZD9q7WjDu+MQznEqTCt95czYdy
         kb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=6UEgGJx7IRv12KdoBKXYB3rS8Hd3GF4d8b4Zu9vybik=;
        fh=uvGlSLfcSt9vnSvrMWc6y0Q6mWiTDHJnOxMsFuBeqTg=;
        b=00AZKDa4c0RMTu0DXSj17bwL3/klQrw38XQNp6wNXcGyWOqxyor5JDVYkm6tDUM2dq
         irOHAFTydPXKx52xLrIshRf+NxnEUpABn1s8F8mm5EAWPrzXkwLISpzutwdjrDdzFJdn
         RSzzxSMWD9JsC/gNfsSgD7fynedsNXMjKV9sBK665t1E1EHFueDmnTQ2MHzA+zIqeplk
         jMCinSw/aoDMebXYUKOGbLpeYR1v28wTjSWXvl2aLAtXCuB8M1g94TlIFXl1tzjOIi0k
         /lZic3Aq1d8iWkF1ZO519Aa0Bvj9HJLfaz+4Pk38Uobf+9U5vYIlm2XFH+h6cS4Eo5ML
         262Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b="QvasVDc/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs38-20020a05620a472600b00767c95d7378si1430255qkb.76.2023.07.27.14.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 14:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b="QvasVDc/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP8bS-0007ie-7R; Thu, 27 Jul 2023 17:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qP8bQ-0007i1-Hr
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 17:32:57 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qP8bO-0007zB-EM
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 17:32:56 -0400
Date: Thu, 27 Jul 2023 21:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690493568; x=1690752768;
 bh=6UEgGJx7IRv12KdoBKXYB3rS8Hd3GF4d8b4Zu9vybik=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QvasVDc/Vgv3LwOiI1reBCFa6e+wYS5PSSEJmsINF+qIPm3IsDY6CgScIlCgHGjA6
 eJCX+2WUKN4sF2GpDVodEXTi7t+1st6Djv+zX9fUYql6/hxTU3eYI4N/ec6n6JtuSz
 npPuVGSOt4VqQ75j6MMtlvnHPiYFwQuFlrAT5t4HXn5C9sJM7zTqnFT6ztCpGgjYfM
 0vMuYMeYgsTIw3+gIrxQiOQqGkDzFr7l5s1/mKfVAb+vDgOvCTIpxHS7gStHTPCISO
 cektS37cOoQV94lkJTduD8BQdo+ZlLmSz9Bf9AE0ZNwqKgjT1d8YdLY53nrcdlaULc
 9oUlN4V4ucC+Q==
To: Peter Maydell <peter.maydell@linaro.org>
From: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 3/6] qtest: implement named interception of out-GPIO
Message-ID: <EEsgXkv-Wn8WPzAg07I02DqCvpurTMkc4Vvb1kwHcAPi7jCW9gCRK7C0psplsefPiOL4ltRhb27ipChaC-nrnwOqNjXOjbtJCH_wwLh2_iA=@laplante.io>
In-Reply-To: <CAFEAcA_K+Rzt8=0apiyO5tB3EwTRJMo8afKu3wkb2=jAsyLvmg@mail.gmail.com>
References: <20230726030450.757462-1-chris@laplante.io>
 <20230726030450.757462-4-chris@laplante.io>
 <CAFEAcA_K+Rzt8=0apiyO5tB3EwTRJMo8afKu3wkb2=jAsyLvmg@mail.gmail.com>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=188.165.51.139; envelope-from=chris@laplante.io;
 helo=mail-0301.mail-europe.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +/rz4E+dNkQn


> (g_strcmp0() can handle the NULL case without having
> to special case it -- this is how qdev_get_named_gpio_list()
> finds entries in the ngl list.)
>=20
> Apologies for not noticing that on the first round of review.

No worries - it makes the code much simpler anyway. Should we bother factor=
ing out qtest_install_gpio_out_intercept still? It is only used in one plac=
e now, as before.

Thanks,
Chris
