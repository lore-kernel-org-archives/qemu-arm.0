Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71184C5B572
	for <qemu-arm@archiver.kernel.org>; Sat, 22 Aug 2026 21:08:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxswc-0000yy-FG; Sat, 22 Aug 2026 17:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wxswZ-0000xy-Jh
 for qemu-arm@nongnu.org; Sat, 22 Aug 2026 17:08:00 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wxswV-0003TW-3u
 for qemu-arm@nongnu.org; Sat, 22 Aug 2026 17:07:59 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso227373766b.2
 for <qemu-arm@nongnu.org>; Sat, 22 Aug 2026 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787432864; x=1788037664; darn=nongnu.org;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ow0qivb23ryyYSnNhnEBLMa+Oms9O2kAQTIOS2JoyWA=;
 b=qmFfDhzDOVOy/nS/LcpaM3q6n44BjKb+7NxyqRgafkX34IEW9bBx96X+sW+qKXHnL4
 UjRQ6pB4AEFILrh+fFh9fOyc2nSdorzWM8fae9OaLrMz1/pmW1LuhkZrDiQ1pNRcxxcq
 vAMKzuVsBgmNCoY1PwP1LTqmT1sEQhKu4vCQ/4nNSk2dk8Dk9GfXW3mX9BQ3s7lS9N8S
 eC9Z7HApRF4gQfUt7ilMjt5Su6ifSGbGlFb6Q0WB5U2mHAKZRuZz41n0OFTr0v4tQCCf
 hU813QKmziE5VrBEgqu7CbFvxLtqtk/dC3Tal0h2057HK+WnFua2AfxudI+MGRL6teHH
 0tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787432864; x=1788037664;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ow0qivb23ryyYSnNhnEBLMa+Oms9O2kAQTIOS2JoyWA=;
 b=emKld3LJDGK6yhEf8ZqvpF4Gve9e0RiFwTo3tNAQdnXcNpi6es4idxY1jTm4tLZ0Rn
 w2r4dtGgQDfBMuE87XC/TfzgEhIcAIR9cVJberyps2Kr1+OYzpESNe8rqJNyw46+PP01
 32YCA7CeaTzfregk7kixWUUlOAUkwOxhClwZo0JU3cYpZ+ZB/TTnfdXouhIhSHjIAoQ7
 MTaNN/accqM018yQ9R48nNL7GhiEwsUesNxVRqcw9c/KuGsRSEupuT0PkPsBgXZGknwU
 1xo5aSLFaH7Uj2K6UDPDn2ikA1a/3oIT0JqqgxcQGPRrmbobkOHIlMzMzvUIR9runxla
 NRtg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8r0sBU9qkDGsFu5UhDFA3koEEuCt+F2+/bayrQ6R+3df4TRmGJQVPlAR/GLDtRL/OJ4jtccMfvQ==@nongnu.org
X-Gm-Message-State: AFuF++mxSvk7gXcOcSGmnL5fdd1rsAfU+OJHNi1oW1Ff6fQZsmFnU3Ub
 OmsH18uUDtOC1LUO3A5ZX3TFcnUv/w6pIQD2RY3g7gOHcrKoFfRF6PV3
X-Gm-Gg: AR+sD11mUSfk7NdWkSGS4sv8Nuitq51l6hnKnPVFBgLZKWPcD/8MmCaHzKpmInaZIEg
 Lx+Ns6DndW2Hyenj1dgq8hsibcQ5zXsLQPseHz9uZyBGIVlFjPU+URf/rLrnlCMTTwqBtI4QP8h
 k8xR/xyhouk6ivgNI5eqH7dpF/rWYTREfRku/mvpzh987hmkJyEPJ3mdbkoKb5UIWaaA8qkXyz8
 35VqMj16vs6Pu6d6Kgz28H4Ctvj8YxMrIlwBYu8evHUtFU/eiBmeCxwlMlm2L+JnaOzeHX9V44J
 OqUYPFln1bZEB0FV/DCxh11+EmDrbk8nD6zlra9w5CZzq4pAA0rNCb5AWomg3aEevYLNcRetjNm
 5jwtADwtqm+zjJ5tBOlAx23WKyPqeA2UFgQtL5RedRxn4aN3LVFFEKXcyl/x1EG8HnaRZ/z6dIL
 MKtrgGYKpYl0FB4/4RfcfNVyYjlrSADYnnvTHMb74=
X-Received: by 2002:a17:906:1005:20b0:c1f:97f3:7225 with SMTP id
 a640c23a62f3a-c246a3072dcmr1201222466b.6.1787432863742; 
 Sat, 22 Aug 2026 14:07:43 -0700 (PDT)
Received: from localhost ([2a02:8071:50c5:5c0::361b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24962a3c13sm518387466b.26.2026.08.22.14.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 14:07:43 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Nick Huang <sef1548@gmail.com>
Cc: bmeng.cn@gmail.com, farosas@suse.de, pbonzini@redhat.com,
 peter.maydell@linaro.org, philmd@mailo.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 00/14] hw/arm: add TI AM64x SoC and am64-virt
 machine
In-Reply-To: <20260821163515.12575-1-sef1548@gmail.com>
References: <20260820124824.618671-1-wafgo01@gmail.com>
 <20260821163515.12575-1-sef1548@gmail.com>
Date: Sat, 22 Aug 2026 23:07:42 +0200
Message-ID: <87o6etj23l.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=wafgo01@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2026-08-21 16:35, Nick Huang wrote:

> I think this is a good approach. Thanks for working on this!
>
> Regards,
> Nick

Thanks Nick, much appreciated!

Best Regards
Wadim

