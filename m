Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3980191eje;
        Fri, 14 Jul 2023 04:50:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGTzNtNQOSV/HGAGXN0+c9cKdoYcyDW3BE0AEcq6IRIWjoM18TWCvLN7r+8RC5L/H9kwEWO
X-Received: by 2002:a05:620a:2551:b0:763:c8be:819b with SMTP id s17-20020a05620a255100b00763c8be819bmr5661022qko.22.1689335448931;
        Fri, 14 Jul 2023 04:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689335448; cv=none;
        d=google.com; s=arc-20160816;
        b=FSqbPRqOntPvu+hG0/QqdNRYz75lvqpKg+AYk1ALMoDOe3ntXujZkZbBSPSVpqogbT
         BEvV6vNoFmMrUhSmAbfaNkG++rR5tGjwmNgtPJcBTIJHMRa8WgH1yciN9tllGWS7PHEv
         zY9SKmnHh7L23AGJnd8+bxCzrSexGVnGpGIzzHJ5yrAI1c3W5qIVZE2FXBGqiz7J89Z+
         rg9dQNjJiNF3UcpaGNl6gLcIBZLPKNgZfvv4uJ84iq+QA+0DD+rfmtCNNUBnXCmiyZli
         K74quXNJvH7z45vA/1xxvzmmakcr/ztYDlILFoqZVkK0VTazbnGmcMcZybQbDoCqPHGZ
         ZCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=oj7NafbvUOzrd5AUQ+cQG+R5tyDTsehfiX1whcx7BpU=;
        fh=dAu1SZl3l4bLd/yxb85dGClRgo++7sr9hD+u8uChkjc=;
        b=Lr0rZSOXj+XRWboYWij0D67Bq4nfpU0VOm6qrzkChM3pVBHxl1j8NRcDSvDRmHij/p
         LlG8tjRNRTWVdjDEUAsWJTqMfebfKIlHkjElorUmFVr8q3NY//Eypcc82H7GHR0qlONq
         qHP2pvKDTh9swe7vFMwfXQpwW7NmLxqejkWBGk4meqIaXuYfdoXrWraD1JCuvxeiixrZ
         keJACbY7VxI1MXpN2Oy2+NEUPsC5spfY3VWN26dQlLjLlvR2huee3EfKvotPTSUisdB1
         SwxgF4hYMkareY/tlvWP6JD2dR/MxGV3UUR15GbDR7F6tisK9pl32ArcqvEKForTrbtV
         XVJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=glFhmh2f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a37f708000000b00767d5f87e00si4214764qkj.283.2023.07.14.04.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 04:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=glFhmh2f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKHJf-0007iF-E3; Fri, 14 Jul 2023 07:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qKHJe-0007hv-1g
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 07:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qKHJa-0002I3-5Q
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 07:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689335423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oj7NafbvUOzrd5AUQ+cQG+R5tyDTsehfiX1whcx7BpU=;
 b=glFhmh2fK3mXl9ELB9GU2oETUDQP3b8lwdd33hqOeOsyP0ooRRf8OJDtyYy+yopzCtj3Qh
 Mw+8yRwCgssYjD6f7KE4v4GFxMpcvriIzKR5et2JwRMcueylTuaCVez1tHwiT/1qAVY0//
 vhBmt/Y+xz3MWuhJ3iBrTkuxTXlKWck=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-mKU1b17wMjKKoBCL2C4xUQ-1; Fri, 14 Jul 2023 07:50:22 -0400
X-MC-Unique: mKU1b17wMjKKoBCL2C4xUQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993c2d9e496so110747066b.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 04:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689335406; x=1691927406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oj7NafbvUOzrd5AUQ+cQG+R5tyDTsehfiX1whcx7BpU=;
 b=EjwJtwtM7qGyrybf03/uILg5bDD7eKCvpweMtnlEv7KAoS+CxoIvSNZ2TyW5NHiFCF
 Fgutkj1pSsIQpjLS6JzoKQBIHVLlYO1qWY+Yx/1MeNQyBiECixxZ0pec+GNMcr3ev/1q
 DAsyzwpeBHBMCqu70WE5hZCRnEouOkj0+I4xU5TZc/iwx0HXf1bCuP3wq+wxsBPNffrU
 T+2rarIJtrcpoY/W7B3/Y+vbxrII4KOUDf1Tgq7r4ZmWkNNuTnF6yq/44dgMNetmklW6
 WRiNY60FDg0uWq5lRlN5u0X2z4W8UjPfdtBr1B9qyl5w3pJfgeNSNiW0SbNHPwAGyKVR
 x3gw==
X-Gm-Message-State: ABy/qLYOJ6TDaDyvZkOJF9QMvPUjwo1EKpYykNSyMIxv4ssaahvNQr4R
 XSnDU0MRuGWc91AYLAo2Uwty7Ow2H9xanFEhGZAgAoTN2CjT6ULCD9CyC8exojugNk38Jk7JlC/
 tvLIFOsj3E5rW
X-Received: by 2002:a17:906:52da:b0:98f:5640:16a with SMTP id
 w26-20020a17090652da00b0098f5640016amr4222608ejn.53.1689335405749; 
 Fri, 14 Jul 2023 04:50:05 -0700 (PDT)
X-Received: by 2002:a17:906:52da:b0:98f:5640:16a with SMTP id
 w26-20020a17090652da00b0098f5640016amr4222599ejn.53.1689335405446; 
 Fri, 14 Jul 2023 04:50:05 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 v19-20020a1709061dd300b00992f81122e1sm5292364ejh.21.2023.07.14.04.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 04:50:04 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:50:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Gavin Shan
 <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
Message-ID: <20230714135004.230c05b2@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAFEAcA-XK0U0bPuAf4K7avdJqnmcibFX_swY1Weo_Tn3wHJ1fw@mail.gmail.com>
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <CAFEAcA-XK0U0bPuAf4K7avdJqnmcibFX_swY1Weo_Tn3wHJ1fw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /b0frDf7Sc5q

On Thu, 13 Jul 2023 12:59:55 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 13 Jul 2023 at 12:52, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
> >
> > W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
> >  
> > > I see this isn't a change in this patch, but given that
> > > what the user specifies is not "cortex-a8-arm-cpu" but
> > > "cortex-a8", why do we include the "-arm-cpu" suffix in
> > > the error messages? It's not valid syntax to say
> > > "-cpu cortex-a8-arm-cpu", so it's a bit misleading...  
> >
> > Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for
> > other architectures.  
> 
> Yes; my question is "why are we not using the user-facing
> string rather than the internal type name?".

With other targets full CPU type name can also be valid
user-facing string. Namely we use it with -device/device_add
interface. Considering we would like to have CPU hotplug
on ARM as well, we shouldn't not outlaw full type name.
(QMP/monitor interface also mostly uses full type names)

Instead it might be better to consolidate on what has
been done on making CPU '-device' compatible and
allow to use full CPU type name with '-cpu' on arm machines.

Then later call suffix-less legacy => deprecate/drop it from
user-facing side including cleanup of all the infra we've
invented to keep mapping between cpu_model and typename.

With that gone, listing/restricting (supported) cpu types
can be done without extra processing and likely can be
done in one place for all targets/cpus instead of zoo
we have now.
(extra bonus: all error messages that include
CPU name will become consistent with the rest as well,
since only CPU typename is left around)
 
> -- PMM
> 

