Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A8B10F92FB
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 20:24:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7fcU-00058M-FF; Tue, 31 Mar 2026 16:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w7fcT-00057e-8E
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 16:23:25 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w7fcR-0005Ya-HQ
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 16:23:24 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-467fd082ffeso3823723b6e.1
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 13:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774988602; cv=none;
 d=google.com; s=arc-20240605;
 b=S/8GTowT9JBmJRZChlmWrP7hS12mCKKciqJgqcaDK27vLH/DXXwe+dsGeJCi30GJPD
 afuncRGAQzl8opHJpnFftzuW3uVVlgm/McvXkOoeBbXpElFXJBdBAqyVPuOl+pPCDMvp
 NpMdoTmTkjkdXusWBegszz5qDXMBH/HKflkVZjhmmtAwCxk/VydkwzIkGRPvDqHeEuQm
 vxeuw4w1B1n0HSKCvjr2bFS/XwCfHm928cP8JNXG7D6x+2dwxR3x9C0arVAwFNj62XMF
 MoC49T8I8RCN+O/z9dddJkMWOa91PY1ba3R/5t/Uwbuj3rP521wB8Mu61NH1lk99cW7x
 vxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5nPPXP+G+xdiwMPcN/NLLOSOFQ4lpAuHx0+p21t3Xdo=;
 fh=nrDyTJ3vuDEZ5+QqZ/IYpUwWK4tOH56kOavtC8nOJHI=;
 b=dFvG3FowEuElvyNMQHl8bSwrGSkR0YNtNE16px/LgTfCfcpTkCPmVb8Ydw1eWTFiOp
 rmXlM2XRrVOge43fQEAOzJCi/OI3o1qtRz1cW/Dk1CoJ1Jqci/ztSZtxw8cXLxd3aeVv
 O4YmkfuC2EKY0FBWXdGNQeIqGuvqsz5AcYkygqQHs8/Y2oNlerbdzTq/jYrROmDJP+sp
 lhTjuqYCCaXJTexvwZPNoHmddwp7q35JvhO2Un3ZZp9m3PJplf77H9cHRkk+BVl88Lbc
 nDHsfW/DDA07GDYQ5fu+Yejj0WPc1Yw59VrLn901yG/o5fldk6e8lcQihn+F17bjkDu/
 skMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774988602; x=1775593402; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nPPXP+G+xdiwMPcN/NLLOSOFQ4lpAuHx0+p21t3Xdo=;
 b=XOLM/KLxfW17bmv0q3h2GRJh5ZJdN2rKXBGLydvK3kL3vcyZQ1uA5QNqGqU1/m4uvJ
 XlPxvYsSBMX/+32ED0h+6dUE2gjYNaJOAlsaiOEO9Zy5VszGYyN9a/GMDglMS478dOZz
 HSB0ky5/LnxNE//lvHrtcF4meuDBxLT5ePCWwqpvb18MDzWykC0PwTjmgSPSiwFeJ2v2
 x1Y5yy1qC6Z3//M83paO29+l3/yFmRIumDKkMYe7NFlV04qfRMuFRnPi9OwS9QhMMy1X
 LQkz3Ry8aIbahPyMVgaoGqdUHXcYJ/wmgquPz5lHpWU8tyQqVGFH5LpZ816gaWOVPzjS
 Y+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774988602; x=1775593402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5nPPXP+G+xdiwMPcN/NLLOSOFQ4lpAuHx0+p21t3Xdo=;
 b=S0lkDeBOlayfW4ROTH3RTV8+zCVpUPh3D9rJwkG/AKoonsfH/Q+tUig7sz1aEYpA4E
 uj7pvbMIKg/qxixWMhbBOi3D0mWRsD9fdKyeW10JvzmvuseLrFsHNYFbUmcaEtbf7uN7
 n7Y8u1S8bZBg2BLVs2mMhTxWk9qCvy4x7cC6neeK0YTR+wtQnC+TQE+MwFty/9oLsbDY
 UNoS26OQm0RwY0qtpyYGwRekdFCAY3o51RjlRKpuAtU/1OuIQnSn0/3wQBuJGnMor+oF
 awcBTuk4aizzHBv7Okcj4OMxUNyLA4WcT+re39d+g9OkdiPWJT5JkbUmXj4xHgLJ9iCR
 4T4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtSzkUD/s8eiaCy1VxfnRPSLtMeM2LXrHkSWSamtv1vaYCmTy3dDFeXYaRw81qpCj8ts44+uO6HQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy/Vz9mrUkT8lcbOIjw87SH2SoZEaGBYsXS7eEpkQng4akmkIQQ
 2PLM2qEEuYFfh70NO+36zd6xlSniXI0MVaNw1jJq3nZAF0nCFotP+XpLHMlabsMt56LJTqCl/ou
 Uaij+LwDk9apRSYJPtkcIoktfsZBnhQU=
X-Gm-Gg: ATEYQzw6n4xiW4mt/fZ1SX3HePifdDv0A3xFrVAuzsTCDYm9KwDXL5LSffaQHXb115f
 097ptnktFPSRKOx26tCUDCb9xgOWPRjnw93Uxu0zeWS/GpSCI2/gA+BEVbESRRgM/s1PEZzZIy4
 Z4mGTYzNBKIYRpXK6zLLdn5mZMMq9E8VXNDKSUGVxeO9Jkws9G14NJph3ill53yxO5vyWr+DU2I
 xKvjGFr/tPTKLyz8HnfvNQmuLDCw4WEMDyOtHYJ1LjO5c/pFt1pmBxEHGL7V9WLUROn4bilQtkM
 2rDKN9vB
X-Received: by 2002:a05:6808:2294:b0:467:de6c:8310 with SMTP id
 5614622812f47-46ae0224dacmr456463b6e.48.1774988601857; Tue, 31 Mar 2026
 13:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260318104640.239752-1-ruslichenko.r@gmail.com>
 <4e8f4e6e-e9d2-4457-af3d-755ced6d2a45@linaro.org>
 <CAN-aV1FER7w1rqw0zM=L2z7MT_RKsBhFg7m6NijxyQa6t5JNqw@mail.gmail.com>
 <4d2d16df-0047-4b96-8312-46489ba0f1bf@linaro.org>
 <CAN-aV1F6O3dv5F1946wEugdLxkYDp0BW6QZPxwye02A5-HYz9g@mail.gmail.com>
 <79fca2cf-7618-4a35-a915-e2bf1811a851@linaro.org>
 <CAN-aV1HRZPxuS_U4mHYhnobbKkq2G5T9P2cJ2=LahT3TzGsC6A@mail.gmail.com>
 <005aa40d-4749-44d5-a65c-8f59cbd06d0c@linaro.org>
 <87a4vu3jcn.fsf@draig.linaro.org>
 <ebb0227f-87c1-4436-b48b-10f5dc150884@linaro.org>
 <88a91611-2d27-4c6d-bcad-09ff32f71d97@linaro.org>
In-Reply-To: <88a91611-2d27-4c6d-bcad-09ff32f71d97@linaro.org>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Tue, 31 Mar 2026 22:23:09 +0200
X-Gm-Features: AQROBzCx3zpceS4nO-cYu2QniXyhkmx5sGita29WEldca2Ot-4AV7i10gEao_Bw
Message-ID: <CAN-aV1Hu_erYqJFpxbm_x3WxTVhuUCFcUVpMWZw3emz7GU-B1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] plugins: Introduce Fault Injection framework and
 API extensions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, peter.maydell@linaro.org, philmd@linaro.org, 
 Ruslan_Ruslichenko@epam.com, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Mar 27, 2026 at 7:18=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 3/26/26 8:59 AM, Pierrick Bouvier wrote:
> >>> One thing that could be considered on API side is to add a possibilit=
y
> >>> to invalidate a specific hardware address (not all tb), based on
> >>> tb_invalidate_phys_range. The problem is that plugin now need to keep
> >>> track of all physical addresses matching virtual ones you want to
> >>> invalidate, which is not convenient.
> >>>
> >>> Else, the easiest way to solve all this is to expose tb_flush, like
> >>> you did, but keep this patch downstream for now.
> >>> If your final plugin will stay downstream (which I expect, given it
> >>> has its own protocol for injecting faults and no source for it), it's
> >>> really the cheapest solution.
> >>>
> >>> The current design is built around the assumption that instrumentatio=
n
> >>> is made at translation time (and not later). So changing it by
> >>> instrumenting after translation brings new constraints we can't solve
> >>> at the moment without exposing internal details.
> >>
> >> We should certainly consider automatically triggering tb_flush() on ea=
ch
> >> qemu_plugin_register_vcpu_tb_trans_cb() so at least the case of
> >> dynamically loading a plugin doesn't miss previous translations.
> >>
> >
> > Sounds fair yes, but not sure it covers the current use case.
> > It would require the plugin to register several tb_trans to achieve the
> > desired effect, which I'm not sure is a good idea. At this point, maybe
> > we just accept to expose tb_flush through plugin API and call it a day.
> >
>
> @Ruslan:
>
> After looking at it again, this is already covered with:
> ```
> void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
> ```
>
> which performs a tb_flush as expected, and calls cb once the reset is
> asynchronously done.
> In the callback cb, you can reinstall your trans_cb, and it should do
> exactly what you expect.
>

Hi Pierrick,

Thank you for the suggestion!

I have tried the qemu_plugin_reset() approach, but unfortunately, it
seems to have the same threading limitation: the TB cache flush will only
be performed if it is called from a CPU thread.

Under the hood, plugin_reset_uninstall() checks current_cpu, which is a
thread-local variable specific to vCPU threads. So when called from
background thread current_cpu is NULL and it skips async_safe_run_on_cpu().

Here is the relevant snippet:

void plugin_reset_uninstall(qemu_plugin_id_t id,
                            qemu_plugin_simple_cb_t cb,
                            bool reset)
....
    /*
     * Only flush the code cache if the vCPUs have been created. If so,
     * current_cpu must be non-NULL.
     */
    if (current_cpu) {
        async_safe_run_on_cpu(current_cpu, plugin_flush_destroy,
                              RUN_ON_CPU_HOST_PTR(data));
    } else {
        /*
         * If current_cpu isn't set, then we don't have yet any vCPU thread=
s
         * and we therefore can remove the callbacks synchronously.
         */
        plugin_reset_destroy(data);
    }
...
}

--
BR,
Ruslan

