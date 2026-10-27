Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA89606A32E
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EKd9KYO0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLixq-0005n6-Mw; Tue, 27 Oct 2026 11:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLixn-0005jf-95
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 11:19:48 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLixl-0001iF-I6
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 11:19:46 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c49b431f022so82635466b.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 08:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114383; cv=none;
 d=google.com; s=arc-20260327;
 b=Bl+keIe4kwXvgFIjnrKWMkB8+8k7aXpbpFPShnM9WRPpjQ/FVnpQNGPDCacWcBq+aH
 dkRIWJyjAitXCmy6EvalgpBXIqDXeQTrz45xvELJhoGGFbglBhnn44qqNk3Uvux+fGNm
 jSTPwBTKGHzSVuVygVxyVhR7mbTVg8ol2frbZB1zNhnbixNDsbD7dOhrzksI/xfbzJdN
 5mwBWcOMIZN+DdAM72+Ys911XQ9E5QrgVOEkc4nCLwNxRWNqapMvIWEpOT6B1BYdx3XQ
 WZ5gRny8VLeUk+chr/YUMRDpE/5RGdoOHXNcd0EwwBwG9BF5OkEKgvsU8O6sYLYSZxxX
 d3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QNLGFEB0BNZwN2ea1M6YUWGW+5mREQVg1wxL9/Q473w=;
 fh=KiiNKavs5JLDMTWqS0HoNfpENDxYfbX1q8LgMtGVaCQ=;
 b=kvvf/5dhZuam/v5246g1MGOaupqcAeTjyGNHcRuYXoNG7Hk/pOnzxILSP/2Qw8z0G2
 2lrgrMWkJfg//JNr5jAgEpMWSZY+JlBtSgi2HToWNBd1OPkYsLoCZ4y0T7mLhxhwme2m
 1Z7ZoTd3Xuii0oLR8+zBYXiPWjBzyb9u8b9p69thWNzTkXuaN4SzaYnXhb4Sk3TIy4am
 GPSP4Zy91JaSrupOhVNemQ37zMRmYcaYwHqGFpxPAsLGExj1Exz18Fi+9qKAlJD6wx1W
 g6d4op8wKZ46g2tV5h64lVWb3ppTrXO/BT1++0IPcmxNazKoqxzuv64j9cjCn/Vb68E5
 s/xA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793114383; x=1793719183; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QNLGFEB0BNZwN2ea1M6YUWGW+5mREQVg1wxL9/Q473w=;
 b=EKd9KYO0Im5LP8FOtJCXRIr51/A3HX7/oiYGSuJJ7/f5WxarNdeX3AyEOkBJfU3fWe
 Q6y8GGWQQ7ablhKqAOknTd7c8AnpDcoc1HHDE+za7UhT4VH57GieQOPUTcACeLh5LNKt
 QWwkm0PVWWB2FTAFcYkMj/ti9z6iOkj9y6zyesaflveoBSRVPpUtF/1Z9+AWpaa5gYYv
 qtOXuMWk4d+QKREgvzlqYrrQBMhaPP98zLZCyVE1PXJO93eH0IMY5s/NHSwmCA8o2xyH
 HI5D2uRxj396uUorBTSUeXDu1S5zYP0XIB527EyJaA4dTRXpKvkTB8mvNrp8ttSfVvMA
 6GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793114383; x=1793719183;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QNLGFEB0BNZwN2ea1M6YUWGW+5mREQVg1wxL9/Q473w=;
 b=T4JdmVgDGWFu2HTkSRul2RW3189cxU6pohDvcCVCHkmdnoANXUVnGuvRqwBJJ2pG/x
 15HIF0khCOngfsL5AAokijKB3iZhhGmafvh8/0R7FiZTuVhTW12F4Ysclpav03FLBZg4
 Y6quSyGKKQRrPtyQPKPsLD74YfBbA+pUhBPRfzwrBt2mt4WHaDnCRf+aCQOeoa1C+86f
 z1FVhNTDy5/Zkr5gvJ5fm+OLPPZQvByTvga6nIOUg9BSM7t+qXF4Zb69uAipDK3ua62U
 EaGlukXlgHNNFth/nFvVMOAPAD1KXhprWQRgrEuY6VMNGEvRykN2EZF727PejB6MjmC/
 /O3A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkpvLqvFikHwjKnzS8XFIoDOcXLzioTprJ5+NiCe8+jik85/iEUJXT1JbVg6ltt34KZjBde0VQlA==@nongnu.org
X-Gm-Message-State: AFq9FYIn6hDzYr2lAOk7PG8YgqeY1a6nuNAMwN6XBJhOaNigdkqqyoz4
 yFi7547U6LJftvWZXNP8yGuKEozWZ0MTWptilqd6OmzR7jtYHF8M8wkf4akbUClH60M2f3l6swC
 u5V1Sa2VVcIUf+dWpOehHuHjUD2+DyvbTuZcBrTvifQ==
X-Gm-Gg: AYBFou1vzoP7uH2NRLmFIC/TomNgsg8ZQls1mVIcyx5X80yR5ourt+vPx43J54KI5io
 PRR5yEuFFKnHGaF/y/BZMAh4QTdpKLa7smVHiyAWKc0CcBklmUmH2r7+8OYRvQVpBusiLhJmcpw
 kOWGF1IWOKh2JRnQ9s7+gLQoUzSdDUL5i+QxJbHMc83bS8DSEpvcA3MYee1ATFN09+0C8s9a5aF
 R79FbTQWZnoLkpJruP1grsnAu5diMX1PNUf31/K1Xf6HgeJUv/WSHHKDoz+VeJr+J/jJxkFEZ1S
 3c6Noq8r9eM4CjviBke6Kl9H3yIJyUmf9YI2ol82Sfbz103oZkLiABf/WyFHSjqFgqAHslxUTHs
 jrptD43U2rtggLXt4nApm/pxd5fKvepDrXgMGllvNUOjHET2UJzwiT+SaHf/QZSYfZGTS+NOU6A
 v5JrAWMZ0yd+gNc43B3Qtj
X-Received: by 2002:a17:907:980b:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c46bdfed1b9mr1060139166b.44.1793114383584; Tue, 27 Oct 2026
 08:19:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <DB8PR04MB7177C8ED1A20409414A573EF87622@DB8PR04MB7177.eurprd04.prod.outlook.com>
 <CAFEAcA-dpfXTLk9KNJ0OsOEaCYppcZLLgcnOCqhUXmOVE2jfaw@mail.gmail.com>
 <DB8PR04MB7177409A95BDC85AC5446A6687612@DB8PR04MB7177.eurprd04.prod.outlook.com>
 <CAFEAcA_BNjFC4vEJ2h62NytzYQXKE0o4MvB2jpN74S05kHRLMg@mail.gmail.com>
 <DB8PR04MB717745592F89F86226B7E73787612@DB8PR04MB7177.eurprd04.prod.outlook.com>
 <CAFEAcA_z5n9obipm=jOieJD0VoSJOTN1MVpRdtHgEDDfq5SfUg@mail.gmail.com>
 <DB8PR04MB717789469E7A52109B5AC9E787602@DB8PR04MB7177.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB717789469E7A52109B5AC9E787602@DB8PR04MB7177.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2026 15:19:29 +0000
X-Gm-Features: AclHuK_qiIKXlZTt8V2Y4LUFJ78tMktuGCd5Avf6Qc9b6VIbTvOoc17JXFpmhLg
Message-ID: <CAFEAcA_6xQi-RCubX_fWw+d7ON6CDy0JzP348RBa1rXdntg=Ew@mail.gmail.com>
Subject: Re: [EXT] Re: [RFC] target/arm: Correct MPIDR.MT handling for i.MX95
 Cortex-A55 Aff1 topology
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Cc: QEMU <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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

On Tue, 27 Oct 2026 at 15:01, Gaurav Sharma <gaurav.sharma_7@nxp.com> wrote:
> I do not yet have a proposal for resolving that generic topology issue.
> Would it still be useful for me to post the i.MX95 machine-model series
> identifying the Cortex-A55 MPIDR handling as an unresolved
> dependency or any other way the patch series review can be unblocked?

Fixing the MPIDR only matters for booting firmware, right?
We're generally OK with taking machines if they can usefully
direct-boot Linux, and we can address the MPIDR part later.

> Most of the series covers the SoC model and the complete boot flow from
> ROM through the System Manager firmware to Linux, so I would like to
> start getting feedback on those parts while the generic MPIDR question
> is considered separately.

The main thing blocking the i.MX95 series (we're talking about
https://patchew.org/QEMU/20260820024834.3286721-1-kylefoxaustin.github@gmail.com/
I assume) is "people who care about i.MX boards need to look at it".
I do not unfortunately have time to do review of large Arm board
and SoC model patchsets, so they get in the tree if at least
two different people care enough about them to work on the code
review.

thanks
-- PMM

