Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3916152lfc;
        Mon, 31 Aug 2020 11:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfel5D83JXEt1aBXo8tnTV4zLrVuuTha3M53miQX/Dtmhx/GJnwfpkmRc2GYc7ulImH29S
X-Received: by 2002:a25:3a05:: with SMTP id h5mr4379481yba.296.1598899897162;
        Mon, 31 Aug 2020 11:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598899897; cv=none;
        d=google.com; s=arc-20160816;
        b=bvmemo/HjxQf+I4vdyLzKYryBjWKM6cDE2XPFIRANJuKG1XEWqx/Z7IX/kHacG+Vt5
         HLCww7JROqsMlQks5O+I9VF3mAibTpsoxXRrgDbu6FjFwYYyjFWlzvN8PpVbK3RUs5b1
         KBv7JmOKucYp7DvWVESwyFy+q2c62r4LflV9cEs8E3r/HuwcdN39x4TbCsM1eNxZlzpz
         EOz24kLTjRFc9IJRdUSPb/CFVfe4UT8PvW2+IKH9r+NslawrKFxmIOEQRYrrTJPoIWS8
         3KihAFoolB0jQomXDxhnDFcVkvkT3ydPlQ88GzglXs/z2KSmjayUvwPG1jEOrG78ICnP
         6UrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ngSNX6i61oKRCCMhSARmE2Ll3O7TRrfnNO3XpiZ87y8=;
        b=VldaUn7svDH50sNDAh4cYd+QWitOPnJFaZ13tYbssa1ifgXCxjCoem173mgMyP0xAQ
         LzjiZcPkOckBG63devDvdDGUpnShCgtul/ysiPbtiubVkosE+ihR3t1q/ObQ5anizmOX
         YDSifvmcYyFmELkgzJWZ/CCmKrTtaSeUCISQ2vog2RUvXGnB7mN/X7mo1hrk1GsQ246e
         nY5Id/kgfaBsZeFoTyiqooF72cc4lD+ZxXSnY3+wN/EPxSYk7jzeP/KNQ4gG6aR3tN3k
         3hE0g/rr8VolwAiZ4E+WFNMr8AC2AkMtRSJFYQaEqLvz8sWPM4OiYgxS6nZWXsrCCrms
         oFzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZhI+ac9e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p77si1569461ybg.413.2020.08.31.11.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 11:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZhI+ac9e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCou0-0003Fm-HO
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCooe-0003c5-6h
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 14:46:04 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCooc-00080N-HN
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 14:46:03 -0400
Received: by mail-ej1-x642.google.com with SMTP id i22so3996233eja.5
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2020 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngSNX6i61oKRCCMhSARmE2Ll3O7TRrfnNO3XpiZ87y8=;
 b=ZhI+ac9ejsHUUMkFwh0hePC85zvhphqVjUGlQMSw4Tedfe6r5A1idihtt8SKz7kFYt
 +W4GUUizaxdkFBSsO45eFJG9zCbF6y3fM1axByEwsfPVbdStE3orA9+kxpsD9GKVWLun
 Dof52xuwQoSthAV+yFF8ABJtzuaszbUfdGsPNOQdtIXhybb7zwJr/6d6q8nzn0xJEWvx
 yheQ+dOWFsQB/u4fdW99voiKaWjMS84mi+kP7+jYJccC7OT8XDyhOvy2Tf2QPxHZu3OG
 NuoJmpvBSG5ZIBvbVJeeRVWIIa8Kw38MqyVcag9pdBDGqP5WnYLGJeIrR/+dVqIzEkqr
 j6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngSNX6i61oKRCCMhSARmE2Ll3O7TRrfnNO3XpiZ87y8=;
 b=c5yimOxrU9kpftGiZNlIR7hh4a/O3oHTAP/drHSX918YMJnW8SBi6L/n8D1+YKhf7/
 Md1kTTulD1vZaWf+IaSd3SFjojSc2x/BUHmhOQp+ET45AK5cPwmJrO/OzOcH8mTbLGfX
 VVWPfSnrZLXAC9sNG4JaCWpAdG5rvr84MfDlJHZuFGYhwrb8yrC8RkXxUsXc4SEvxovz
 ABMUXT8bynhqY/4ywo4bQkmxPJmaHnIhfq3KiEcTPcOwgb5pOLTdxffQBDSdhD/fz5oX
 CMNx5Po/Wge8Y1BAN8NUwCsSsXTPDc88NJbetGi24kDx9ck76+Zzk0bil1o3BoHAABPa
 CgBg==
X-Gm-Message-State: AOAM531x8Ggpbu7E60ZbI+9JvGaf1iooNCrVefmjoSDlxnrrrs3LFzb+
 o/1mtx7zqWbf8UEIlmaz78sSavt4bRv8uWeMRs7UDDKtGmVciw==
X-Received: by 2002:a17:906:71c9:: with SMTP id
 i9mr2203762ejk.250.1598899561319; 
 Mon, 31 Aug 2020 11:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-45-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-45-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Aug 2020 19:45:50 +0100
Message-ID: <CAFEAcA_wEKdnYwy4PL0qCMRTwG82P8aJhg43Go9wSnbuk8N_CQ@mail.gmail.com>
Subject: Re: [PATCH v3 44/74] imx_ccm: Rename IMX_GET_CLASS macro
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aJUUJq1ENqWW

On Tue, 25 Aug 2020 at 20:22, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Rename it to IMX_CCM_GET_CLASS to be consistent with the existing
> IMX_CCM and IXM_CCM_CLASS macro.
>
> This will make future conversion to OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v2 -> v3: new patch added to series v3


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
