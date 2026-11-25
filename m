Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A8606A323
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Nov 2026 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zdS8uJzI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWAF9-0000FY-7i; Wed, 25 Nov 2026 05:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWAEv-0000Df-VQ
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 05:28:39 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWAEs-0006Zf-Tz
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 05:28:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so44414355e9.3
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795602511; x=1796207311; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=omOClHHY+dYH7llh3BJ/W2C937+rEw5ySaFTFmPP8Cw=;
 b=zdS8uJzIy1oj28TD7t+vsSuOJbGux1ihUz7FzaKu4vEcDbcC9JbRuqZvWw335Eesao
 HkEE6X8IvVqD7uVagXl8i4HiUaL7Kat9a/ZTcAFRhj8l7NCvd+3E/EX/8LlLQ8GM8iqr
 PdR1krfwxT6DMXFmds6wU6TYW87+1A1raD/nIsrneSmdEUzVQyvVvXkOot+fs+ayksCU
 PWLaJ0qVzOrGf/cItugwc8Jo7J4+pLLdDwdqMhkRJpKijjjmlD5I/3r07XkPUsk4wQsP
 0Hz7IZmTPxRYkkdDeSK5NQXmCdj4Fyqr5K41l/mSn7uXG8Xyeqlta2lb2mhDw42ll/t2
 uUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795602511; x=1796207311;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=omOClHHY+dYH7llh3BJ/W2C937+rEw5ySaFTFmPP8Cw=;
 b=cPz9sfJvA+4QmpTJrwPT1JDUq9YFGBR6hvz8NT1D1eRaVmUA/f/VXdYvWAxUE5I3KX
 wuPy7oV908u/CpNG8sZgWrRfQqDTdj+4p57txZJ4MWYNEZt0fDqEjqJpdKOQtBDrBoma
 cvP8HzaQC2p+AmXYN7ueKgsi+K8DU0qmfpyotEtd6YgVJbk47fmiNU0WqP1spa8PtYKO
 K7TD9JAzWGiD+z/5qWddZZ8oDlG91g3h4VnjioY/MHWhR9hzuHh2AM3Owhwmpq6Mu6kV
 Aq9Ve4FI5YdMb12ngepOX/GK3uvC+sQQAc51mbSSqXqZ05scDOU6gK2mLTs06ZYTro3a
 RYDA==
X-Forwarded-Encrypted: i=1;
 AL+hErG8ZU5bH2+poRxRJMKDGmZVxSh93zNoFPZASRdBoIC/KR4ws8QkHKowhXtAmDYmhKQRkQVuOvhGAg==@nongnu.org
X-Gm-Message-State: APuU4Z9TIWcddulA1XFu50WKWxPp8dbjJs7u0urjexPKxeKoeAt3r2Di
 bfugJooIUtOdUHncjgR5R0MeRrefJcSt4C35V4tfweU6Hws4b3ij1G+C3ZETnmN4okw=
X-Gm-Gg: AZFdTZfrZt7nfC4EZUM66VxsLxU1c0kxn/6yKAL8+hZ+nkonhIA2CjBM/F31P2T/UMs
 LLyv0ky6gnnoabgtltjdsqRkSu6xf4hPcfuFJgub6uTbR6tHYDwW+KdK5qt/djDTBzPUn1Yu7tB
 oZtBJ2YpF27Dv4Mu9M8ly7G9ARMSi9OCqrwdRHeYuxq3vmjZvDQLq/9PSOkOY1MZTk4MNQnabT3
 mq54rYKffDDfQhBA3RRAnEdWGHrqHHPZFl9Q3ve01YBEzDeTQk6YJ+Dq7AfU/wQyZ3myRh7tG1D
 dlr5VrTTc/C2+8Cdoa3PcJBq0IsgPEkY2gnwbNoNm9aMLkhprr6FLWbB6XeoArxU1JiZ+/N1gYS
 dRLfaEL9XgYcpTQHdheyM3ejMkJkB4Fom4emuJAc7MuZ01Xq5oPnkvLHUxUH5/LSIi4cNM+j/2S
 EoZZBcNYjSbyWx0njjb8cj88nQJCBaEA9UrvCP76YKVqT/oQPBUQju0mlSr4xkogw5clSRsN9H/
 TC7lUvQXHuVnoKGoJNzXleaG+SHqo3bCHvBwQYy49VqxW6vbfyyiRoYFayxf9+2LJFul4koQn/t
 C/bSPKfxMg6u1BFUFsLUj7Iaf4YSEYE=
X-Received: by 2002:a05:600c:8b11:b0:4a2:a9:ed5a with SMTP id
 5b1f17b1804b1-4bb88826835mr347159575e9.8.1795602511032; 
 Wed, 25 Nov 2026 02:28:31 -0800 (PST)
Received: from linaro.org ([2a10:d582:31e:0:82ba:bf15:3b4:e45b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm724982925e9.13.2026.11.25.02.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 02:28:30 -0800 (PST)
Date: Wed, 25 Nov 2026 10:28:29 +0000
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Gustavo Romero <gromero@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] hw/arm/sbsa-ref.c: Increase SMMU space for Root
 registers
Message-ID: <awa4TeIZmS4c_udY@linaro.org>
References: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
 <20261016-jmac-smmu-root-registers-v1-2-e78e8879d347@linaro.org>
 <dxrwkmt76n62imxwycc6j2mcjihdhqmhukzc3ypojuepkprzsp@dm4yqcp75wrt>
 <avSYUeEmFFBdVePq@linaro.org>
 <47529a98-e02d-4cfe-a8b5-8b3f44bda15c@oss.qualcomm.com>
 <xl3axqq44u62xqw2gahgo4cehbapbirkywpbkyx547mdya7ycs@qekmzwnxmco7>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xl3axqq44u62xqw2gahgo4cehbapbirkywpbkyx547mdya7ycs@qekmzwnxmco7>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 07:59:00PM +0100, Gustavo Romero wrote:
> Hi Jim and Pierrick,
> 
> > > Thank you for doing this. The only complication is that we'll probably want
> > > an x-realms flag as well later, and if we do the rearrangement of the map
> > > as above then SMMUV3_ROOT_REG_OFFSET will have to be variable. I'll handle
> > > that when we get to the Realm part.
> 
> @Jim Why would you need to rearrange the SMMUV3_ROOT_REG_OFFSET? I was expecting
> the Root registers would stay still at +0x20000, i.e., at the start of the
> "OPTIONAL pages", just after the "SMMU Register Page 1".

I was thinking of a configuration of Realms SMMU registers without the Root
SMMU registers, but as you said later this is probably invalid and in any
case not something we need to support, so that's fine - we can keep
SMMUV3_ROOT_REG_OFFSET as a fixed 0x20000.

Jim

