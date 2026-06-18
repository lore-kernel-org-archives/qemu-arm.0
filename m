Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D800DCD98F2
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 13:22:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waChX-0001TX-De; Thu, 18 Jun 2026 09:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waChW-0001TD-L8
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 09:22:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waChV-0001dq-5p
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 09:22:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-462342ac290so1089633f8f.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781788951; x=1782393751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/F0+Ax1zYQEzhQ6Gr26gkcQR7UbRcGCmo9VNENRVu1s=;
 b=Ml4QFCxmUzvxnzvsoBCF34U079p0bwCo2PyzxHlsIo+v9ea0FpVPPrarOLi6HJ/f62
 +ELLKXauIK4QadMCSOf4/YQHL8RdSrI/slp2n+bS17mejPjfWtdLM+Uaj1vdTdFZeVIt
 l1ea84o3fxRjHMwQws5iNzkMFqhTGTZTorWtSH3NNpthF278HMfJDDq4j1t9gRNt7NqP
 g6OkAq8aBUJW5cxpYF5ouGthPQZH+bgBBoxEkv3507XgPVpB6LJpjxfbSz6YJz3omZvl
 FY75oey0d6tsRR+Do9g0BzS7W7GNP5nJIfqb1TU28qoGw7/4FImL331W2xTb3ejkeAdw
 NdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781788951; x=1782393751;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F0+Ax1zYQEzhQ6Gr26gkcQR7UbRcGCmo9VNENRVu1s=;
 b=ok20ppw2VlG9J96Mp5CM5U7GLbMuES9VezSJhuEc5R3rJE5p4q8+aIL9GAdmbpKWkq
 jMoWUGayGmBOlfeCq616Wkr9r7YdH5JYfmYIgikieiPB5lLT5CaUCBYIVlQ39kCK27Ie
 3A2TlE25x2/jY+7PhMEUY87/wz8B8JChKi2eH9yFIW/5Gj5M34VFlzVB2664OmFwB5XF
 HIe37C4xOmO0hGFA6bI1UL1gUMRleBqNBAaWZ2vTanU/V0Vlzh0mw65qLJ+r9ZSi69RA
 LDehPdTQr+i1upFh+/YV+LEVScuInhMWLDJGSr9jN89yJZrh/Km42dS/Do16nRqaf6ET
 ODzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8HwQ7C0ZhQBSpgoeQ7t1U0IE0CUUi0ryojfxnCh4H4eiDGO+BQGgprl2pYECi6pkom4xEUJCG0+w==@nongnu.org
X-Gm-Message-State: AOJu0YyMnyB++yfPHDBBqhxjywKTekM6jk9YrNpW39oF++m3Gnqf3ttp
 mCYgcIno4lYZP9DwyQD8E98+YBtFytOsYnvdPGBcs+zwnmQTs2Owskq2uCEksm/Y+YU=
X-Gm-Gg: AfdE7cls7Ur6LWHCq6YXP2wreuRfLBNW+TEnnwFkOXlc58ep646PIbZsL4Tsm7rbsYJ
 Ep509uLDcdzu2wZr2ONE351sPZduL9u/+vm4vKeBWzjzc4GgzuTzJ/CQOf+WEOMFD3IbSCYkI9l
 gdzcbOyQ36KrwsMO5EmrXXbKOZWTiFx5uURgz3edQuJKLgXoo+VMkZbnKQoOkKCIYeduFyAqZP0
 4OHKzJCv7TUKUNRVJzcZrzOjS7rE0vMfWxAU8evHFpPxty1L7Avs/GtPOX2g021YPSh1Ior0WZm
 EnzZ6wh8JEQLFG2Sn2BLJhAlvkgJ8rRLt9EZmaMn38KLdskF7ghTtfL3pZXezshEumJhSOfhBKO
 ONUvQ4QrL3MkW1SUF5exifJC+d53YkBtE6iNlcbY0JpFy2yb1jLTK1yXLEHC3mju5lFCANMzrf8
 GieQUj+rC9eBon
X-Received: by 2002:a05:600c:c84:b0:490:b58b:a8ca with SMTP id
 5b1f17b1804b1-49234131ffamr119754035e9.27.1781788949696; 
 Thu, 18 Jun 2026 06:22:29 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923a1d2d9esm41763215e9.1.2026.06.18.06.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 06:22:27 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C09705F905;
 Thu, 18 Jun 2026 14:22:25 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 3/3] target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
In-Reply-To: <20260618-jmac-fprcvt-v1-3-1b4475bacf51@linaro.org> (Jim
 MacArthur's message of "Thu, 18 Jun 2026 09:20:25 +0100")
References: <20260618-jmac-fprcvt-v1-0-1b4475bacf51@linaro.org>
 <20260618-jmac-fprcvt-v1-3-1b4475bacf51@linaro.org>
User-Agent: mu4e 1.14.2-pre1; emacs 30.1
Date: Thu, 18 Jun 2026 14:22:25 +0100
Message-ID: <87eci4gezy.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Jim MacArthur <jim.macarthur@linaro.org> writes:

> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

