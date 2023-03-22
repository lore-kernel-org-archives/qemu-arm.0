Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5573906ejb;
        Wed, 22 Mar 2023 10:46:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set/B5JBBqby5gDD+9EtrMIdIem5B2OGZ5Mbnjt6ZJA7M+ddYaAgBygFxECqcAUl/u0ZzS3v/
X-Received: by 2002:ad4:5c6e:0:b0:56b:eb95:9a52 with SMTP id i14-20020ad45c6e000000b0056beb959a52mr8406059qvh.15.1679507176591;
        Wed, 22 Mar 2023 10:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679507176; cv=none;
        d=google.com; s=arc-20160816;
        b=DoQqG/HEpm12EmHDcdGTVV5JbyxGAqmPpPCUymtRZjacsRvDgZ5RFuquQP53A3QHhF
         03nrGBF7UA4FdFtXPO4l2QmYJnedZj/N/8baUQSRIt2pmI1k3PkToVUqYnoCtOhuvZKX
         yZ6DeBqahFOk1XtCgcNJSX3Er2b9/ya7gGh6PBvne/fMKAM7Rij9bl/WxdiUJohZP+VT
         C5wA8ikSTIp6FrPfUIbYTnCt6Ua3iani7RRIOCCtc9mTPv/0uHk9oypuhIk4LXOS7/h8
         viu7F060hFQLFmLrEghjiRExmbWF7VtfKWRI1bKqLCeBSXZlL2/dcb/aPU/Ze7KmI533
         nx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=rQ+46afQyo/ocgtqIMO6SapyQRkrX2+kvN8yoxsBizA=;
        b=BAwN4Spx5NU12jZPXU9DlMPAsSFZu2mr+stjkDMfm9Lc6LjxHB37uwza+rC1Es8wJs
         7BuuvmhPWkWr7EUnzCvx7/P9h94eRd1xmKvgjLN4DPq7vX4FUOuzDhC3fzmb8ArkTlxJ
         bpq+eI73vY71Cc8ehMGrLayPyE04PSGH4uL3AGVS/G1diepkF4DxVpa+YYzML0QlZ+Zp
         WBcLCR2SvW0m2vvJl3QqER+K4Zqy/fadwks3xN7opDrqVdTQ9mATGwamhP5QhiGmWO5A
         /YWILlPAk4bIM4TslY3s+sHrTuFSWpmt9Lw6esgvqW4vgzXjquW9f28hdm6XFnc2pg/I
         sY0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z5uvNxml;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16-20020a05620a411000b0074696e7729fsi5101462qko.511.2023.03.22.10.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 10:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z5uvNxml;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pf2Ww-0005Oz-T6; Wed, 22 Mar 2023 13:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pf2Ws-0005Lo-Dn; Wed, 22 Mar 2023 13:45:44 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pf2Wq-0008CT-PW; Wed, 22 Mar 2023 13:45:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 921BD33DA5;
 Wed, 22 Mar 2023 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679507137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQ+46afQyo/ocgtqIMO6SapyQRkrX2+kvN8yoxsBizA=;
 b=z5uvNxmlzxBRGOAv8HhaW+OueVe8IuB2T1hPLtyVOfbliDU+PLMLUFTTGATH+ZcRuK5m7e
 1RCuKCRpWAx2+XIRw1q+XQ6IR9C+BHtRIxRh/meMcbPgUtftR28zlsUXJ6Gj8IpTB7Y2JW
 65K7DItw2l7zF8unQYDJf2nD5Lyhnhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679507137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQ+46afQyo/ocgtqIMO6SapyQRkrX2+kvN8yoxsBizA=;
 b=mtOSGn5FvJaRlDbVQwHeZ55GgKIU29Ntv9xrHQEO+vD35CkmUGBty+U37hw0Nt9+0xf68p
 wtiW97FIpc7N/PAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E077138E9;
 Wed, 22 Mar 2023 17:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7c3HNcA+G2RYHAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 22 Mar 2023 17:45:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Claudio Fontana
 <cfontana@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
In-Reply-To: <3d67c765-20fc-9ae9-1dfe-753f4ef16263@linaro.org>
References: <20230322142902.69511-1-philmd@linaro.org>
 <3d67c765-20fc-9ae9-1dfe-753f4ef16263@linaro.org>
Date: Wed, 22 Mar 2023 14:45:34 -0300
Message-ID: <877cv8smrl.fsf@suse.de>
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
X-TUID: aMqab3qqFDvp

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 22/3/23 15:29, Philippe Mathieu-Daud=C3=A9 wrote:
>> Fix when building QEMU configured with --disable-tcg:
>>=20
>>    Undefined symbols for architecture arm64:
>>      "_arm_v7m_get_sp_ptr", referenced from:
>>          _m_sysreg_get in target_arm_gdbstub.c.o
>>      "_arm_v7m_mrs_control", referenced from:
>>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>>      "_pauth_ptr_mask", referenced from:
>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>    ld: symbol(s) not found for architecture arm64
>>    clang: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
>
> Beside having the non-TCG configs tested in CI, (I think) we can avoid
> such breakage by moving the TCG-specific declarations from
> target/arm/internals.h to some target/arm/tcg/tcg-internals.h header.
> (target/arm/internals.h is 1400+ LoC anyway). Worth it?

I think it would be worth it. That still leaves the issue of these small
functions that are semantically related to what is being emulated but
don't need any TCG-specific symbols. It would be nice if we had a
default approach for where to put them. Without going back to sticking
everything in helper.c, of course. =3D)
