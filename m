Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3486284lfm;
        Mon, 22 Jun 2020 12:58:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzspJ5VneVCXOwIQeKXQQXkPPKsgXWmM5EfxTudVMcbspgucQrgng0MTmp1bCatru2/k2TF
X-Received: by 2002:aa7:c504:: with SMTP id o4mr7902169edq.311.1592855884551;
        Mon, 22 Jun 2020 12:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592855884; cv=none;
        d=google.com; s=arc-20160816;
        b=RaIScGo9t2lC1yEZcCjnUWV/n8QkSoYD4w+XJ2zgVKuWqfhDHuydpNlsNLl9HprQ2i
         gA9Gmwt55JNNvW30Nhu55uUoWXEK88y5fNhEJO9TFQFoxfhO49O7z64N/G0gebZuUnZe
         xEnwx1SlRTMWpjkwnKtbY9pSV1H4gLoHK7Frn7Jp0YqlrTFY5LTJEUDrKFc09n+/hYDa
         OorKm4PjYwx5sKeOiEVT6n5LDPnxwyVDNPFOfS3o5ShADDr/hAHHo0uMnaS39ek6rStW
         tbzDrYxWGaktWBsb8f+nbwQXENPFlrANLr92likENtpCVh2EGm+4J85vi7FtxP/IJ4OG
         lJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZHtfmO0X2IMDRr3k87n3VRnRH4Q5pS9Wc8iN4phHSsQ=;
        b=Hx4+sgTFSz9QJlVixuqaUqwHUm+/KKhJ/Y4CawmzGXwxxr/qsYj7shuHyJ+ExvNgOL
         sSM7t4FycbrF5zVS9FFj+Q7C5TewTqW0SqdQWNUjCRirS7UjMEBR68obu3iFvjUktU6q
         M+q/zwFxZquqNC4I3lbRanBhjqqMqfjID2mc6hoa13OMce6g9zJH1LYYZEZc9T8kUe5a
         +29z9aIHf4NrjSWyD+SoFjYnrZSpMaLulsoP3WVeDuaYRb3Js5SmuVk6NH1D9Q5/RdjE
         Rv+s65mS3Ib+9uUOBq9vqbceHXlN+GvA17fZD5AfFtnlBiyeXHBWmTfdGSwTxs7PblxF
         R6sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBEOMWj2;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id q10si8967695ejp.503.2020.06.22.12.58.04;
        Mon, 22 Jun 2020 12:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBEOMWj2;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgFVT6D (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 22 Jun 2020 15:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbgFVT6C (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 22 Jun 2020 15:58:02 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAA8C0617BB
        for <kvm@vger.kernel.org>; Mon, 22 Jun 2020 12:58:02 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id k15so14184943otp.8
        for <kvm@vger.kernel.org>; Mon, 22 Jun 2020 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZHtfmO0X2IMDRr3k87n3VRnRH4Q5pS9Wc8iN4phHSsQ=;
        b=tBEOMWj2zXQPq8sw3gMHdaWJy4rCMk8n3EonoWheEVvyce8pfup0DVXxYJwXBChQry
         IHwztsKrWh/ANF/YtfBYGCP4MRiU8M6wwwjFMlNTyZLOlxrb5PINk5O/RL6JHrOhVQsu
         iVn7J44n6pXcUzWyTMWk4RiEagNht1Xf/haBMdg5CLXeSHfcDPp1YlMClSbiSbiHA35M
         X2KwLho9XmrquLRvwSz+WNAASfQLKUbVH5OJB5w/ISqTuX2GzwB+4p4O4Y6iD38vq8Uh
         lFQkHhAOwgoNmWEWQnof3ey5Hrg7R5gQDZlNCzmvm6LeNZai9NM7ejD21WZngX6tH7ys
         4hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHtfmO0X2IMDRr3k87n3VRnRH4Q5pS9Wc8iN4phHSsQ=;
        b=G18UqZWdb7+ydSkgsYDg1Vf26rfYBeGjQ1LcMUk3r25M6ctn/IwzQMPHlY/EW4+pqK
         YPdYatpT8lReeLwtBBdPCv5IEi0ecgymjNwwaWhGGBabVt/ZyzezjK0lSrGIuc9I3j3R
         DsTJOnA2kWgnHUP3rP0oPCCbcmo90MM1vRgyaVKnfdElu19+qrf6EL0eTyI7kXZORwWY
         B8TEi2TkRDP1g1ElB3bG9RS8+3N++FipftW5Lv2UMxvZ44RwrjxfTN4SVW8PUNvVC1ze
         aNKdmjg3QrYu65bpdcAW4gugj6PM+aLmytb8m2mdh1Jg6OmaTjOGl782+FcYY/kSPCN0
         zA4w==
X-Gm-Message-State: AOAM531/yv2Y3H8HPpBdzK+xP3PvlffFs0uTIrKfaD22P0NgnW9F6CeU
        cgvg4QU/6LvgkSdOO/RSis2Zbo4EOiLyUu9OHSCRsg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr14710011otn.221.1592855882151;
 Mon, 22 Jun 2020 12:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200619095542.2095-1-philmd@redhat.com> <20200619114123.7nhuehm76iwhsw5i@kamzik.brq.redhat.com>
In-Reply-To: <20200619114123.7nhuehm76iwhsw5i@kamzik.brq.redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 22 Jun 2020 20:57:51 +0100
Message-ID: <CAFEAcA-3keThbaWccv+Rzh4dmnLquSwXMyEOmbMMHgQHM=c-8Q@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Check supported KVM features globally (not
 per vCPU)
To:     Andrew Jones <drjones@redhat.com>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Haibo Xu <haibo.xu@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: HOCga92hrC5s

On Fri, 19 Jun 2020 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
> Can you also post the attached patch with this one (a two patch series)?

This would be easier to review if you'd just posted it as
a patch with a Based-on: and a note that it needed to be
applied after the bugfix patch. Anyway:

+    /* Enabling and disabling kvm-no-adjvtime should always work. */
     assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
+    assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
+    assert_set_feature(qts, "host", "kvm-no-adjvtime", false);

     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
@@ -475,7 +497,11 @@ static void
test_query_cpu_model_expansion_kvm(const void *data)
         char *error;

         assert_has_feature_enabled(qts, "host", "aarch64");
+
+        /* Enabling and disabling pmu should always work. */
         assert_has_feature_enabled(qts, "host", "pmu");
+        assert_set_feature(qts, "host", "pmu", true);
+        assert_set_feature(qts, "host", "pmu", false);

It seems a bit odd that we do the same "set true, then
set false" sequence whether the feature is enabled or not.
Shouldn't the second one be "set false, then set true" ?

thanks
-- PMM
