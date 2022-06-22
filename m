Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2446454lft;
        Wed, 22 Jun 2022 13:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tlH7jbRJhPuIgjagB9IQCbiumMhd5/DCNOkp6K3KNJxJoFCT6o1xgsFinbWu+DIgQ/i/2n
X-Received: by 2002:a05:6214:e61:b0:470:29c9:1785 with SMTP id jz1-20020a0562140e6100b0047029c91785mr22934868qvb.52.1655931578886;
        Wed, 22 Jun 2022 13:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655931578; cv=none;
        d=google.com; s=arc-20160816;
        b=Th09YhbpfYjoF1pLj4xgKSwu19X9DRRD3aRUsBOGzm8Uu7kpLWELK2xrJlju9JpqE9
         gMEQslH9ucLnffdmSUnUFbEzh13LIaDtjoH4uX6bZl1zcH6qKXuCvfvoI1xM63evtehT
         m4aqjcPrcuVjQQRuJeUlSZ3Fr4T3Jk1AX6tzY3PV/8cb9PXaUUyjXN8LjXIk41S3NQNs
         ndtqXBj1JqcU3JcevpqaY3k+rwwkGMf1Eei8cO1+EohYAieUJVj6ePpZoBDRR8WY13M6
         fdXB9rIv2UgSJBtRAeQ5/ZBavFCuyKCmrPJ6F8fGLe2n+1ugWWWNG6gnPj9g/qPb5s4l
         /fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sx9rq8Lf7HbGyLSlOoc6WGlEoy++zzAiZ3xvimjEBBY=;
        b=hFcJYs5ooHG1wwtiBNjbiU/grJjNYx735ccwHdisvlLBZNU0D6d+yHydmzx7heKu1i
         gN6Z6ZmkSMG1JlcNZAtdjfCMpdMhqGu7XX7pC1WNuFgUsKZF2B43pG8Njoz0X7lItAbz
         Ths/rmUotQI6vWlsNIyPlikFb7MQcCCDNsV7zUQclizrD2wFnQ0tN/QXimA95ZFM+P87
         9BRXlYoK1AYMLzLshopL9oKiVhb9CmThtIYw9Cx5PoVuJ00yC7DM9zTndaCuI9nZH5/g
         MW1fJypI0pdIuhT5V9SHOykWJePjd/YEnQeU9L7xSNh7FY8kkZNGM41xzHJu8VHIXrrY
         53ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=P4Af5xeA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020ae9f108000000b006a725ec488esi2184227qkg.263.2022.06.22.13.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 13:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=P4Af5xeA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o47Rq-0005Ci-Dl
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 16:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o47IT-0003Dg-1R
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:58 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o47IR-0004KL-AI
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id o10so25598617edi.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sx9rq8Lf7HbGyLSlOoc6WGlEoy++zzAiZ3xvimjEBBY=;
 b=P4Af5xeANsQI1sqhFHztffNJ9D5cNzT1vSTsgOn7St5LBkcYmm7r4/BSAE5PY6o0KG
 SwnK9T1hyvZshMTLE5E8uBS3LaKUS74xv6vd+iKQCQBxjvJXBMvMJIRuE5pAhw+oj+aa
 5gmBirimx32Z9aNOAwur4suYccwFnBGjBscMxN2Js9Kl5uvQaDUxLzv7sKUpGEdKcprA
 mX3XdxKr4wgK5XZOyUOjDPO25vAlJmGd9UHQn/hjLOENqCAEY6EvadlYSYdqG2txhIXt
 9zy7TGaQ2s+Qm3P/3Ht3wy/aI/m44ous7WcwiGMOWZIJf7MXEH7/VmzBR4bmAnV6zsPr
 I1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sx9rq8Lf7HbGyLSlOoc6WGlEoy++zzAiZ3xvimjEBBY=;
 b=T+Mwmrtzt63DqnKgSHl5mfTQXObyjwUhppG79pk4wMsLKs5uRkN6Pxtrwj+d8/c5K3
 jQchQUQ4aD+Vsyvylgn9jkJI4D0w1uTX8P3rm8fdOrz77hnW88G7AlEBe/AQZkroAEBY
 FTA++KfkwHOSoJKstqBjwdEg8noR6ixCSOmZ7te6cARcaK2FQB5HU/JXZc9AN0N+FEGd
 +UrjCGyEa6BWYBL0zmlotLMUX95o88c23gnuoaesmXMPBPT2M5felBZm8qczYffZOwy1
 g+vJIgHe0e7IvCNANJPFYtsPaBg5TK0JByBuNYs6QJzObUHoNkl9JzcY0eofWXZAwAue
 VNTw==
X-Gm-Message-State: AJIora8k6ZZEZZC3ozY2lfXb01djTm2kpJevYOUKFBvivdAoWT8t3Uo3
 3xRHu42WTD6QiEQGePstnRJ5CuMJazjG+i3WQ9Yt4Q==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id
 dz17-20020a0564021d5100b0041fcf6c35a5mr6411817edb.25.1655930992180; Wed, 22
 Jun 2022 13:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-6-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-6-quic_jaehyoo@quicinc.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 22 Jun 2022 13:49:15 -0700
Message-ID: <CAMvPwGp6Rr3g5Rn3jAU1ZK_99oxrx6z=4ggUWFheL_ipQnJfHQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] hw/i2c: pmbus: Page #255 is valid page for read
 requests.
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=titusr@google.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xszzCBtLvHEu

On Wed, 22 Jun 2022 at 10:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>
> Current implementation of the pmbus core driver treats the read request
> for page 255 as invalid request and sets the invalid command bit (bit 7) in the
> STATUS_CML register. As per the PMBus specification it is a valid request.
>
> Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE, on the page 58:
> "Setting the PAGE to FFh means that all subsequent comands are to be applied to
>  all outputs.
>
>  Some commands, such as READ_TEMPERATURE, may use a common sensor but be
>  available on all pages of a device.  Such implementations are the decision of
>  each device manufacturer or are specified in a PMBus Application Profile. Consult
>  the manufacturer's socuments or the Applicatin Profile Specification as needed."
>
Thanks for this, the copy of the spec I used was older.


> For e.g.,
> The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
> refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
>
> Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")
>
> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> ---
>  hw/i2c/pmbus_device.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a15e..7db3343a83b6 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -291,7 +291,6 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: tried to read from all pages\n",
>                        __func__);
> -        pmbus_cml_error(pmdev);
>      } else if (pmdev->page > pmdev->num_pages - 1) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: page %d is out of range\n",
> --
> 2.25.1
>

Please also update the stale comment just above, since this is now
specified behaviour.

Reviewed-by: Titus Rwantare <titusr@google.com>
