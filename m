Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1168971ejb;
        Fri, 9 Dec 2022 04:51:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7rKMdcmosIlfeoyUOlkJcoGKcGAjfs3NhpiBoUWqh3nHKnx0FV5hO0jM+ezP6nT3zxLVvH
X-Received: by 2002:a05:622a:590f:b0:3a5:f9f8:3ec4 with SMTP id ga15-20020a05622a590f00b003a5f9f83ec4mr9022977qtb.30.1670590268861;
        Fri, 09 Dec 2022 04:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670590268; cv=none;
        d=google.com; s=arc-20160816;
        b=Rd0xJNLnahP7dkuRZkixvpl0VF/XE83igSlTOP0bAvRQyket+5idhNl2wuWjj8qA3+
         XaL42LStKygLWTTP9/ukUqC0nGPtlwHYqkltQCM2xG5ZuoNr+glVxwbkOzgY/TqHgq42
         BEkJClELDH3TkZOnd3oTws6djHmmYeZPDjTTHXdAPgaJ7eEyknHokwFxpX4Fd3zufvH0
         /FY47x54aFsUvd6pFVzPuPM7ZwTb7m9oUMoV8xdus7YFr+/a6ocVpZ2yeK0uwLtvanfp
         3Z68cx2kH6WsHNOPupFaAT11wZWTnGlC0WsQ49Cc98tcY4jDg5bstqHMRSiU4U8VN1FQ
         UmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=XYGsyV2yK1Ik/jF7wwqYZxCTSkCE9sS/NgvjjPAn0L0=;
        b=GUaNeczjZL2MQQtCknltf1WIDj1ABbNMZLbwcK3DgM8jL/jQddNsEXq1+pGaw411pV
         BVzX0sSoVg70ynJiAkELpHcJ/8a7WmMx6fMVNCp33YyrpmvsPc2eqkWL97P2ugtD0Uo3
         ArwapeV214CpCJMP/KlWW3X6ASfeih/u4z2Ep6XEOMLhjUvsrJ2acJ54k7RZ4X/0c93i
         0KtiQ+SBzZKmvHiGTFSpxYjOnB39tRWCYXZkMOALFofIwjmnQDF+qVjyCrsSI4tx1Hoq
         E1HtJiWPkzKPkgU2IoihrA+Y8SZ4bJgxD+4XrAXV0s5CyErWltShPT6zDD+lI8yk/6Gk
         iNXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0fEfsTy8;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=RSx9jILG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc5-20020a05622a488500b003a5fce03843si671517qtb.559.2022.12.09.04.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Dec 2022 04:51:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0fEfsTy8;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=RSx9jILG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cpn-0006T2-6V; Fri, 09 Dec 2022 07:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p3cpm-0006So-7S; Fri, 09 Dec 2022 07:50:34 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p3cpk-0008LI-Mm; Fri, 09 Dec 2022 07:50:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3180337EB;
 Fri,  9 Dec 2022 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670590228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYGsyV2yK1Ik/jF7wwqYZxCTSkCE9sS/NgvjjPAn0L0=;
 b=0fEfsTy8RtQQ2FXpMsC+ttp1l28nks02YcZ9HRVmUduypZMKPFCgDddyvE479eQePQWsKQ
 5Yw2gUk6EyVBU1aP7oUWeH8VqeBiZmsvAb7PllY9IXf7Atvo8ej3BMA6pnpI38Cq8+cea+
 nHq7bmyxBisv6aOvmcLzWRV5x7K+mRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670590228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYGsyV2yK1Ik/jF7wwqYZxCTSkCE9sS/NgvjjPAn0L0=;
 b=RSx9jILGC/MWNu/r2MWwVW9JUPcpNVgxXdCTD3vX0ndtmyRUEKhKwzgH73M93zjLrmDh+e
 EKke7CXf8WhmjEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79F1613597;
 Fri,  9 Dec 2022 12:50:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VNzMDxQvk2PuWQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 09 Dec 2022 12:50:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH-for-8.0] target/arm: Restrict arm_cpu_exec_interrupt()
 to TCG accelerator
In-Reply-To: <20221209110823.59495-1-philmd@linaro.org>
References: <20221209110823.59495-1-philmd@linaro.org>
Date: Fri, 09 Dec 2022 09:50:25 -0300
Message-ID: <87wn70bv1q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yoI2zannT9nE

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> When building with --disable-tcg on Darwin we get:
>
>   target/arm/cpu.c:725:16: error: incomplete definition of type 'struct T=
CGCPUOps'
>     cc->tcg_ops->do_interrupt(cs);
>     ~~~~~~~~~~~^
>
> Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
> handler to sysemu") limited this block to system emulation,
> but neglected to also limit it to TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
