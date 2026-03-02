Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6648E9B342
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 10:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx0Ek-0003wx-27; Mon, 02 Mar 2026 05:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0Ej-0003wc-Hx
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:10:49 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1vx0Eh-0005vA-OC
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 05:10:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48371d2f661so92485e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 02:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772446245; x=1773051045; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q/oJUAueGMqAN5vJj4HKzRaE1Y8ehx4/TGbh37nLqVQ=;
 b=uCGJIMExEtJc9i9aahi4II/wzKTa5Z0q5wtTgIHBYldTQMCFZYRBu4WMkeZgA2ssWZ
 9dcgioiT4JwWe2gL8D3ITjeJ82GOj5jvWMbdbUSpr9MnwxHjnN46r9rZkk7YNqCtzmFW
 EmWCPSvGFB5az4n320wXbm+lMg6fwOUKW+Mnf7ldnJlJwS/3fMJ2FY4WUaa+jgfOBWv+
 S2yblRDv+l5FOeV2qdhsTjkNI33FKVSi6aiUllHCVnlSH+9ZijiPuFbQNC+rSeDVbftQ
 aOpSeduL3VwW9eNJT0IBVDqnxkb3HH+dV/bjTEdPy+leQXu7mIVOVpnSIgPbsGVP1LYk
 jHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772446245; x=1773051045;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/oJUAueGMqAN5vJj4HKzRaE1Y8ehx4/TGbh37nLqVQ=;
 b=we460A/JEA1OynnP0wTDCeGM97hV/Gn/YAFvF5vSQyu8xJr7+mF4O1QtrBoOXEXx3M
 +e1cIUa19Ob2vxjqCkBK8w5rxYaqRSD511k36KD7D9N+v+53THMXgjUs7/Vq2NPkGb6f
 sSNo+e6F0+S6h24CE+ua1QwbuZcrbeUXfOTDNBYTUcZbq5/2rZEQMVn/SwL1ClHUXzk5
 zIsrgJg+WkxsxBCjqr6ZhxRm3RVwLu5jo1Lze1DfNq0T9PFzZiDhDe+rr1CZkJIRGH7C
 QaY06KBzbhaNRV8G0y5DyeLmGlvh4c+tJ57VP+ucOPpvZzyhb9Qgzon57KAehTk5GYSv
 jKJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWszUmPMl6b5nS7EGnv1sdFJq8ZPvrsJczUR+6kNY0+3J7wK7T7RgLY8kf8TIHcDUtKTm7hIP/TBg==@nongnu.org
X-Gm-Message-State: AOJu0YzaeHEXrSHi9M8v0llUwQ0mzo/1kFLaXrLD/ApaTEVZlDk0mvXa
 olgsQ/hJockc8FOtkDwHiQxPfRL5UkptmTNG4CoOxoTtnwMz2p4cWUe56JEs1Gf+wA==
X-Gm-Gg: ATEYQzwZNfX2NhF6j9DYlbKPhvByUJwXEwUqaZLmhsSbouIGd37EA8fiENz02RAOYpw
 ZC8ARY3fOztWT7dcZDHRXjgvDQtdOjV4exQfHgvylngm6XsuVP15/7aN6T1nOjRXfMtneOQtCZ4
 RwXMp6qSZD2oF0ESHcMDF30RkA4TcGRyH3lNok6iHCjACFjdSLE/OE03062oqTkgPDy8sbGAQSg
 pt55qKA5W7HAqIJoCrVWU3vrwnVvGDNnJxs1gjlueflG0+bx1kFdCLFIoR3KlGtScLEXrzMFbnQ
 1o/BW5lfRroY3Cm3BP8HmDrSrE2cq1EIEAXesEVW7WHuSqbG2n/mUf+kLM+jaOBH3XZRaHOROlE
 cvp1I8UX3WuiRGsAfQB61i/MIo4RgmkdshuyxK8uvuWNCWO3VVik3e+TLaPQkAqmP7+X35vsAD6
 s6eYUSq8pClCZWcfBXPECD5SzH9QWStB12HYxdVIgZ3BxjTJA1gf71g/aDa3Ywvz+P
X-Received: by 2002:a7b:cb8a:0:b0:483:1093:f29b with SMTP id
 5b1f17b1804b1-483ce5e98d6mr1499245e9.8.1772446244538; 
 Mon, 02 Mar 2026 02:10:44 -0800 (PST)
Received: from google.com (206.56.155.104.bc.googleusercontent.com.
 [104.155.56.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750607sm396115035e9.10.2026.03.02.02.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 02:10:44 -0800 (PST)
Date: Mon, 2 Mar 2026 10:10:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: Re: [RFC v4 19/31] hw/arm/smmuv3: Fix CFGI_CD handling when stage-1
 is unsupported
Message-ID: <aaViIF9FgeJO5aDy@google.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101733.2995020-1-tangtao1634@phytium.com.cn>
 <aaGu5v0To65M5LkB@google.com>
 <585be3ce-d5f3-455a-a7fb-3181920cfc60@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <585be3ce-d5f3-455a-a7fb-3181920cfc60@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Sun, Mar 01, 2026 at 08:33:15PM +0800, Tao Tang wrote:
> Hi Mostafa,
> 
> On 2026/2/27 PM10:49, Mostafa Saleh wrote:
> > On Sat, Feb 21, 2026 at 06:17:33PM +0800, Tao Tang wrote:
> > > Add a STAGE1_SUPPORTED check in the CMD_CFGI_CD and CMD_CFGI_CD_ALL path
> > > and return CERROR_ILL when stage-1 translation is not implemented,
> > > matching the architecture requirement (IHI 0070G.b, page 176).
> > > 
> > > Fixes: 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
> > > Signed-off-by: Tao Tang<tangtao1634@phytium.com.cn>
> > This is a separate fix, it can be sent standalone to make this series
> > smaller, similarly the first patch.
> 
> 
> For #1, #2 and #19 commit (this one), since I’m not fully sure about the
> expected process here, should I resend these already Reviewed-by fixes as
> standalone patch respectively right now,  and try to get them merged first?
> 

Yes, that's my own opinion, that would make this series smaller and
slightly easier to review, but it's up to Eric.

Thanks,
Mostafa

> 
> > Also the "Fixes" comment is not accurate, that was probably broken from
> > the stage-2 implementation which was added later.
> 
> 
> I'll remove "Fixes" when resending this commit.
> 
> 
> > Reviewed-by: Mostafa Saleh<smostafa@google.com>
> > 
> > Thanks,
> > Mostafa
> 
> 
> Thanks for your review.
> 
> Tao
> 
> 

