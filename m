Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28333D44C66
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 15:54:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgPg2-0001m9-5W; Thu, 15 Jan 2026 10:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vgPfo-0001hw-Qz
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 10:54:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vgPfn-0006RH-4A
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 10:54:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so5236765e9.3
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768492449; x=1769097249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fndLlosvQnl1BWQl0z72nD1M8vMdnIudDdlcH+pBB+U=;
 b=LmJavGAPbgY+x4gnukwgpB4e/J4Yjvzud9Ho+hFjyKbNW5gl3gJ6TzpHA56timj6vz
 oxB6B95WbRmo+9TEZ7NUdjlK2z7CkloR6MZElc9YAKdzr5/F+kuiuaruG0j5zJoZ922I
 7u99qcVwx1xjlSpI/mo19gNvBn48OAyAsRSzLKPhhCMWuSYfBfdMuUoPGbdqorm7STdB
 /B+M79678YcA3J8ZD22moD/z5Dela26fXy9p6/vw1LP7YWWIh7QGoYo32ikbHWJkd9Dl
 njZPTmBsfd/1fFpu4uksWjKUh5Lei2JCKHPJXqGrO8R3cDHUMN6zDa+LgsJ03TiDX7Oo
 WKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768492449; x=1769097249;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fndLlosvQnl1BWQl0z72nD1M8vMdnIudDdlcH+pBB+U=;
 b=sp+mw/cWQ2CSYD6OnItUDIqHY9GrsKFS2pbKRgtHSGNF/jVzEd8XRySDAn4l9eHwlC
 uCpd27jGYxhTzSIaUsSkxFXk9eiq10je49dmw6Yg6KvIkVONe+kEgqedwJBYYcxowh3m
 IWCuywdAA3hU4kfpk0Las6TogyOoVdn8JGbdoOSwj2HaIeRS0PzwVByTDkU1hjttBcyE
 fbn/siIfCE6Rgwv/6Bd1YkcKShCnt+Hpf7LybeOGkt+Y0kczHukMLrzBfdxHvkvY4Fav
 GgRx8A6evdlPDWHIh7apdyVWDSkB2UIncL6h/NZcoWe9V7ggwD+Ev3GwHWUmh1YPPEaX
 +ZKQ==
X-Gm-Message-State: AOJu0Yxy6v1RGPk/+4lHgyzJjnZhg9wd20yImpvJzPt3E+uadjGIzPRV
 Q4k6y2239bJQjU1D8faATT8c2kDqDZ9om++VdTOTvkJ1jleYDLu3rw1rt2/Ot12IVv4=
X-Gm-Gg: AY/fxX6wvDBIiOergBVZnpygFYgxeq9KAcnyjpcCJ/ox5a2vdC65AQY2O9P/9ilcLr7
 ZLwbx+k1bXDUmUYuXb9DrEHZ/8KhNd3H31X4uHHWZpPdVhb+htymQqSgZO0KOSprLOty2KLvK+6
 TrWslHkr0YP1C8k09qlDb1PFYp+3I/6qXEckNSegsKRHBGTJ89lNWbKhC7Fvuy5vVsvZtZDyQp9
 WUSpC0484q/h9Lfhh8ypnVWuTeKAJ6n/vKzGZKX6ZbFWrY3+YSO4I2WKRgSjBbUtd5vS88ET7K/
 9YhRIiN1RAyE6RbMzzkFpuPDddoA6xQ9hnydss9TolqJyoiuYDJSGINdtv6xd6avPVTa7DsgzLL
 6HEsr4nISK7iXBZhBMRzMAPxRrQPRZARihRBZF2x/BQX803UMBPfnwKhRLmt8rs3ecBNOFtFKJt
 QrB6uFcCq5Pp4=
X-Received: by 2002:a05:600c:4e50:b0:47e:e952:86cf with SMTP id
 5b1f17b1804b1-4801e3502bamr2215885e9.34.1768492449323; 
 Thu, 15 Jan 2026 07:54:09 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee11ab892sm47478665e9.6.2026.01.15.07.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 07:54:08 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DC9CF5F88E;
 Thu, 15 Jan 2026 15:54:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH 2/4] target/arm: Correctly honour HCR.TID3 for v7A cores
In-Reply-To: <CAFEAcA8bF6p0RhT3X5RUNo-BjNy1mVzUwc_gKv0L45oxZiEi3A@mail.gmail.com>
 (Peter Maydell's message of "Thu, 15 Jan 2026 15:35:19 +0000")
References: <20251231170858.254594-1-peter.maydell@linaro.org>
 <20251231170858.254594-3-peter.maydell@linaro.org>
 <87zf6ww9fg.fsf@draig.linaro.org>
 <CAFEAcA-YDPYQ7mny_zFjgjWc4W8K18kUVuBgFbQ25sNpsM4Vvw@mail.gmail.com>
 <87a4yej41k.fsf@draig.linaro.org>
 <CAFEAcA8bF6p0RhT3X5RUNo-BjNy1mVzUwc_gKv0L45oxZiEi3A@mail.gmail.com>
User-Agent: mu4e 1.12.15-pre1; emacs 30.1
Date: Thu, 15 Jan 2026 15:54:07 +0000
Message-ID: <874iomj2hs.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 15 Jan 2026 at 15:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > If you have suggested names that you think make more sense,
>> > I'm open to them -- since I started by knowing the behaviour
>> > to me the names I ended up with seem more "obvious" to me than
>> > they would to somebody else, and it's the "somebody else" that
>> > I'm trying to help with the naming...
>>
>> I think I follow now. My only real suggestion would be to make the name
>> _v7a to be distinct from the v7m profile. Although HCR.TID3 seems to
>> exist for v7r as well.
>>
>> Anyway:
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Thanks; I'll make that change and apply these to
> target-arm.next.
>
> FWIW, v7R can't have the virtualization extension, so
> it doesn't have HCR.TID3. Virtualization for R-profile
> only came in with v8R.

Ahh found it described as "OPTIONAL set of extensions to VMSAv7" - so as
a subset of the memory model architecture. I guess because v7r is
PMSAv7. So many acronyms ;-)=20

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

