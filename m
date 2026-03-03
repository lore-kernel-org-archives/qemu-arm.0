Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4016EC1423
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:32:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxN35-0008Qt-4O; Tue, 03 Mar 2026 05:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxN32-0008Q7-E9
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:32:16 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxN30-0001dA-Oo
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:32:16 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-798374d0f44so85804587b3.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772533933; cv=none;
 d=google.com; s=arc-20240605;
 b=aIA/YCe+6uxSF91wO3Ma+7lefIRFS57D5i6xqOPdX2JjkdrsxP6/ANLcuXNEyHlA7m
 i8HZJyckk0IDDTGa7qYPKaW8ojRaMOt5d4jezGB+o0qq84OhCJAqs6kEJra7p9s2g7ki
 O9lQGuZxsTEw9Quf4r1d4kyBVMrGDIisX69wy4LlC6YZMxQfiIvWu7vdaLrpFoSQEg7m
 FEg5BT9fTD5LqjeFKcALWGPP/kKIdxG9kinxjFj4bZ1u7Ms1AinBzPM+XUUfN1EAJv6o
 aPsM4XVUYAM10oCnZT4WTnQ/eOSTGUUehYnFFXh3jS9SyNoVzq6H8Tyhn2DkUpl5higS
 QXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4xpMyo2OZSHduvV8IMeijq+cNP1Xb2RRq64vgwLYeYg=;
 fh=+OPS8WIK0VEeIhKG8xMsf5KaBot/bMEFx3ze0z0P9PA=;
 b=cRley/Lxlod2PlkEbUNHnq+IbffTndv1QpsonPB6dvh1UtEGTGRy8OvdUmmUoInd0i
 d/Sdlws9xfAtVhW1QD6K8Xqdb6hbiJECo2aQhAFldx/cm+VhcBOBQiw5ldHndyBp5e7W
 4MzHJskrU7PR3CEte55CLTzKMOITekzRYiPL2msCNs5Rh3yCr81iEkuiTW2JMRrz3o9b
 3apuc6utVRzEeKENxkjQWmoetFnANosLgkZsmNO7BUWc2rPZZva+KBqMtDUqQBGSCQ3h
 ySzV76L7wySqnNYb9in2b9LIEQIQ+RGnV5inBLPtcGBn+vh19IYJMsPVGB90k1i8zu3Q
 ew6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772533933; x=1773138733; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4xpMyo2OZSHduvV8IMeijq+cNP1Xb2RRq64vgwLYeYg=;
 b=WCK/he7ic1VYyLbblVP4ZAWHuQoAtjqY5FzBX5VYrWs8a9w9b5EhvN03mgIKMXwLX3
 HHWY2iXem7A1vBGo0P/p7htIQmrK9Ytl7K/8preECWulFFDJ2k2asv/ZULJNHcoT4/+L
 KVoK0BAzCQFuIAzApsVm/aCKRiV5lt0GNsSo1VhNPvgtAWZsTPyFxJPa5AFGKU9Ixt8D
 +tnVnTNpRTdDRVkQN6yt2kGHafHBz6iijUBxMI5B56RvQCJpA58t/YmRD1I8Y/vxn5qE
 wEUqommJrFsiUSoBRoGm3Fo0D/sT5eCRhcDx2qUb2f9Ky+i4j8tRoauaHcAyupwflnbh
 aNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772533933; x=1773138733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xpMyo2OZSHduvV8IMeijq+cNP1Xb2RRq64vgwLYeYg=;
 b=pLnl4uQxd7B+BEGYYp2Bn6BRWN78EagL+/7HeNHW9d4L7c/JpXa3fDSr1iVYenNhK5
 iWAYDFmLpKGoK3oYS/be77rmji2aMky1CD9O5nJC/9OeXckKrZZ3F+yDBO77EknsAuDS
 dFQkb6ErCEY2d9JbOJFxvplgsQ2FX2In4b9vsSLKx1HwsQgdmRf5caOtHshUt5dNk0az
 CCtZ/W7mFXN1LJ++jR+ni7FUkqXBl9CW+WMrX9M+OSNHAUgOu/Q7AIeBdvmQ1L+Y+868
 yANAJub+bq8HoPiDPeFdo9F73yP/eEwgGNEHkVux5CDR9B/i843JAbU7SSMruVOQ0+Rc
 EtLA==
X-Gm-Message-State: AOJu0YzbTTrnjm3oceTsV64Rwo1yj2nNLrk4tTH1L295B3IGrgBVn9en
 t/s3/1m5Blkn9CEdrvVcvV8bIgDLI6a/z14hSvQ8N5/Da5MFLj/h/e78DPkR18D+5dcsFQAPe/P
 UHqsaGdcCPYyjJNa9l5SNOuKT/nDR1UZeEfSJ3SYwrA==
X-Gm-Gg: ATEYQzyDH/JADdNGo5qWK+BoirMtpEIpDA+kdkcSDpa02t5BdMfDhua5oO9bJRLFBuQ
 5tFiZeOzfVlmfFnQVAKxkaJK2m8u8BYNuTn5MyVx0GUAjkaZurFBS8m+q4n/rtoUXaP6d71Bdf+
 LBpyEO5JikDveAlwrWVUivqDXyiUqT2iOpJta5vbmbZHwv6VBYKUdQJ/5O3p2UAhBweO/6SQ9PG
 zms+AavSHs1r2vixlNQMTsB3FXVNs6u9hgshlYWc6FDgAO0EJDYbZPyVXJtpMKplh4KFMK9lfZW
 IMxyNK3HHSQH7yQKQtU4tezPVHcKU1C/9ByouyJc/D/u4uAAnFGLa/5TS/P1/+OXlUg=
X-Received: by 2002:a05:690e:1510:b0:649:e9f1:bb9d with SMTP id
 956f58d0204a3-64cedcf1569mr963659d50.36.1772533933509; Tue, 03 Mar 2026
 02:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20260226084456.112142-1-skolothumtho@nvidia.com>
 <CH3PR12MB7548985B33D65D626DFD840BAB7FA@CH3PR12MB7548.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB7548985B33D65D626DFD840BAB7FA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:32:01 +0000
X-Gm-Features: AaiRm50cFYSLpLtxOTOiEI4FK-02CfPFKipUSM641kCisiJYAxAWFdtEbyF2vuM
Message-ID: <CAFEAcA8t5ZL_8YgpnWN+C8HvX0auXEsyGfXCqSRtaR=wXEMsCA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] vEVENTQ support for accelerated SMMUv3 devices
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, 
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "philmd@linaro.org" <philmd@linaro.org>, 
 Krishnakant Jaju <kjaju@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 3 Mar 2026 at 08:22, Shameer Kolothum Thodi
<skolothumtho@nvidia.com> wrote:
>
>
> Hi Peter,
>
> > -----Original Message-----
> > From: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
> > Sent: 26 February 2026 08:45
> > To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Cc: eric.auger@redhat.com; peter.maydell@linaro.org; Nicolin Chen
> > <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
> > <jgg@nvidia.com>; jonathan.cameron@huawei.com;
> > zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; philmd@linaro.org;
> > Krishnakant Jaju <kjaju@nvidia.com>; Shameer Kolothum Thodi
> > <skolothumtho@nvidia.com>
> > Subject: [PATCH v8 0/5] vEVENTQ support for accelerated SMMUv3 devices
> >
> > Hi,
> >
> > Changes from v7:
> >  https://lore.kernel.org/qemu-devel/20260219090103.33697-1-
> > skolothumtho@nvidia.com/
> >
> >  -Picked up R-by/T-by tags. Thanks!
> >  -No code changes. Commit messages updated to improve descriptions
> >  (Patch #3)
> >
> > I think this is now ready for 11.0. Please consider.
>
> Just a gentle ping on this.
>
> If there are no further comments, please consider this for 11.0.



Applied to target-arm.next, thanks.

-- PMM

