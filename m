Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp681490lft;
        Thu, 30 Jun 2022 14:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJzpiwPnGViuneM6kMrpkHVMYqGrhWgrysSXgY/9UGKxc2LfP5RLDeiwwCiMfm/nUhO6Wn
X-Received: by 2002:a05:6214:21c4:b0:470:4aa8:1eba with SMTP id d4-20020a05621421c400b004704aa81ebamr13308086qvh.125.1656623800907;
        Thu, 30 Jun 2022 14:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656623800; cv=none;
        d=google.com; s=arc-20160816;
        b=mZo8iCVhzUEMtZbm/miCZgh9FFxWMKmhiPzjgoRWHoALR+RSpDGH2lbXm58ngsEWQv
         wHPJHzDONHWCaHRdGcMLVJz15rFvpuSdQTI1yAme23bYErsKuEiT/DSPymDbp1EEzhFp
         9/uwzbTONHTAcJS6xLI29k65QNKniAO02R6CH4CDiLcwY9b1g29iEGzV1EJTAlJNrCXs
         sykRvmfZs7+pUX5vBn0cr08fuR4QVokbcqGDp5Hg5ew2Ut99tHiTpCGaYGUsyxO3CcfC
         TYkH0Xh4t0uzPL5rDGX0a/m0LbTvnggZ2GGb9mDdO4MUNu3JdLSjUqUP35MCfcyYTAuh
         ZAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=kuX5VNGbqROSQD5WrJ+yQeDzR2lY2rYnTSKtaCsXSXU=;
        b=NWcRi9H/kxmb4qxD5BvwGudpQIozNAGKNPzUhyp16XZ8SzLX8RluLszeCgYrJKKNoq
         zu1lOcfvefBTxGuu8/TN7CYdGswEzWRDsZFc10LLoEkfVmFR214JN6kMkZj8J3JjTCnc
         KT/1mh72GGN+MgKuggm5hn/kpaTmNMFyR0j2tsL/liqybNWd83xErVVlLah6rotW7rwi
         i8Ehc8pn0jyPELRGjGfC/F7GFxaEOAY23a+/4jcngjB6+KxYWnqrNvICviBFVRHr0C1/
         T4RWLC2L4p9Y7QyEFOi1ACZ7ERW4SZevawG/lO1uS8+4lPhoPBqwG7qIbPpcectHVQwC
         1d3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=kpZC5jGS;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=aM9pjBzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020ac85fc6000000b00304b5f49461si12145500qta.206.2022.06.30.14.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 14:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=kpZC5jGS;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=aM9pjBzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o71Wi-0004BO-Bf
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 17:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o71Uc-0004BC-Ne; Thu, 30 Jun 2022 17:14:30 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:52981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o71UY-0002ib-9K; Thu, 30 Jun 2022 17:14:30 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65DF0580349;
 Thu, 30 Jun 2022 17:14:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 30 Jun 2022 17:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1656623664; x=1656627264; bh=kuX5VNGbqR
 OSQD5WrJ+yQeDzR2lY2rYnTSKtaCsXSXU=; b=kpZC5jGSrYSzyAmdukBrIQ3o14
 DC/j5PM1i6dV9NUHoa8sY63xiH9IDz6Z4YQ5gw5HFrfsmLXTIFBY0U4LB29BcSbu
 B54LUPDq+qkHyZOGq5JlEIe+8rD34KrhJTNfiyOJFuX+1uWhj+EottsoolKjX+ia
 UH7kp27D8Dsz0nPwOlXjCZDrzpWaXytOAXo2JA4XU1Z44SbJHKNRFai+UYWtURid
 mDjljuW7iwRZKN0q5r5b4BMS866Cz+K1G7qK0qSqqYt8QtNZVVZT7Q78kY50lJ2d
 AXka6a1P0zh6IUszX46rfJ2lTcx+88IbZ77I1xjr+3d5ES96nAfB6C2hXYJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 i9e814621.fm2; t=1656623664; x=1656627264; bh=kuX5VNGbqROSQD5WrJ
 +yQeDzR2lY2rYnTSKtaCsXSXU=; b=aM9pjBzQmlE0rv/Qnedi7hxozAXL1AjkSU
 v2k7IAl+wdV5gV6rYQrnveRNLeQUMvDgheWYUz0IYITlYs+PZ1x15ibCbSjoua3L
 jFEXCWA+QYooaAIDXLkp/esp0gWc2gv5qT5zz+At+yjz5oyhaLAC0W3bnc/JolsO
 9OhAMDGWdD/d4VTy9QRnj1poownWNL6TOY1XkQu91EeUr1MeS8MSdyRB/M4qc6W0
 Dvc4XXqSlUFO2Vp2FUZd9cwLYEHfTNceDXFpFGnre8c2LSjzPXp0pX7c6EA+xBL/
 Y1uxo5LxJ0J4E9I+qcSSOK5ChsDhyLz5ox2rMEYlFk9/TA3v6GOw==
X-ME-Sender: <xms:LxK-Yg1ncxon9a37NuFP1eeQtGUjQcQN2Jv_KQr641J4vKccaYVPZw>
 <xme:LxK-YrGqqn9XNpJ07hP53M_kla-06qsgrNlYHX7ozKWZYeOm1KaxOuOtlarcAXm1S
 rHfCZYIGdFMc8QCVGs>
X-ME-Received: <xmr:LxK-Yo4LkoHwD-QM1hYn8tUz8tyQ_zAJ875lSIQeExb1GjS9OiagdnZhVNvvtqLLMdxKr5-B1-n0YmiJtA4ft5kq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvg
 hrnhepvdekgfeggeffiedtjefhueegleeiiefhfeduudfhveeufeffleffheevgeevtdeh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvse
 hpjhgurdguvghv
X-ME-Proxy: <xmx:LxK-Yp3rW3HOGFkXzYaVWkfeoyp52EzPfqK2mktrIgIGI4C_rx9KzA>
 <xmx:LxK-YjEk0nAUcSvUMBFtPiz5Mnl_JPY931sojHysQxf--GdAEUvmkg>
 <xmx:LxK-Yi8LEDLex-NWiEHNEDSZcWpMPB_llT2QH-RosvAGNmO2K7MEFA>
 <xmx:MBK-YpbzMr5odLoth1gJKjm_O_eu5XoHzq4hCgHnRq3NPUKe52i8sA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 17:14:22 -0400 (EDT)
Date: Thu, 30 Jun 2022 14:14:20 -0700
From: Peter Delevoryas <me@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 zhdaniel@fb.com, pdel@fb.com
Subject: Re: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
Message-ID: <Yr4SLOuKAHBBa0nH@pdel-mbp.dhcp.thefacebook.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-11-me@pjd.dev>
 <CAMvPwGptKGEkDf2MqED8EatHoY-szncDmmJxQKvKDj3YhrbCig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMvPwGptKGEkDf2MqED8EatHoY-szncDmmJxQKvKDj3YhrbCig@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=me@pjd.dev;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D7XRoc0hjtyo

On Thu, Jun 30, 2022 at 12:16:05PM -0700, Titus Rwantare wrote:
> On Wed, 29 Jun 2022 at 21:52, Peter Delevoryas <me@pjd.dev> wrote:
> >
> > From: Peter Delevoryas <pdel@fb.com>
> >
> > This adds the ISL69259, using all the same functionality as the existing
> > ISL69260 but overriding the IC_DEVICE_ID.
> >
> > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> > ---
> >  hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> > index 799ea9d89e..853d70536f 100644
> > --- a/hw/sensor/isl_pmbus_vr.c
> > +++ b/hw/sensor/isl_pmbus_vr.c
> > @@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
> >      pmdev->pages[0].read_temperature_3 = 0;
> >  }
> >
> > +static void isl69259_exit_reset(Object *obj)
> > +{
> > +    ISLState *s = ISL69260(obj);
> > +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49, 0x3c};
> > +    g_assert_cmphex(sizeof(ic_device_id), <=, sizeof(s->ic_device_id));
> > +
> 
> This generates an error from the checkpatch script:
> Checking 0010-hw-sensor-Add-Renesas-ISL69259-device-model.patch...
> ERROR: Use g_assert or g_assert_not_reached
> #27: FILE: hw/sensor/isl_pmbus_vr.c:126:
> +    g_assert_cmphex(sizeof(ic_device_id), <=, sizeof(s->ic_device_id));

Argghhh I should have caught this, thanks. I'll replace it with g_assert. I
didn't realize there was some kind of portability issue with using
g_assert_cmphex in non-test code.

> 
> otherwise, LGTM.

That's great! Thanks for the review. I'll let you and Cedric sort
out if we want to make IC_DEVICE_ID a class property or keep it
in exit_reset as everything else class-specific is right now.

I'll still resubmit the patches as a separate series though with
the g_assert fix and your reviewed-by tags.

> 
> 
> Titus
