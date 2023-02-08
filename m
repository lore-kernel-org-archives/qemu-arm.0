Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp57799ejb;
        Wed, 8 Feb 2023 14:14:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/BUeJ5kUqxmRlBHfNHYBL9i2i+Pw0oKzLjZ0C73lce7FQfWJ78y5+HP7aV7JUcsTma6cUY
X-Received: by 2002:a05:6214:27c6:b0:56b:fadf:e64c with SMTP id ge6-20020a05621427c600b0056bfadfe64cmr5198597qvb.22.1675894485102;
        Wed, 08 Feb 2023 14:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675894485; cv=none;
        d=google.com; s=arc-20160816;
        b=0N4eivzYHWzeHyjbSfrQ8Hsgwxdnb2xkvt49Y2D4hSY9to+XyT8WvDIZPzUcg1iPsn
         bL5uqoqKUfz64S0OVjgEozM30Kwz0+vajbo7S5O84COuQ1cHuMA7zNFrpvr14DISYWk9
         bY5LUfxkmo+R5ehuY4TeLm3W7p/nXRt4LToe4vUQYHIzLwGA7WNqM+5JmVN/YbinEDz0
         m+6OKF8/9IZYYaIYU5xplNd7dcm8Wt+Y3BJzQ5ZtNsTdv3k55kYYJHyeWhmVKByeWGbJ
         lFSrqjpWYDZ+VoF0VoSVdP7lmrAIbEx4wFSWf5QRVtCB+yM7zvaDxelO1kpzVuflWjYp
         gBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=lQ6EljoD5QK2A8I8CAE85syLfcXMqsui/fAOwmLyO1s=;
        b=sWG17joWfFEJI8scMnV2SISBpiT8c27MxnFuC8yS+vtuFF7102ABWfCRIKkdzHkOMf
         e6enUJgwV0ou66kjSpEnXAr8igHkRY14Yz5Cm6qi8o9K7lNrlejDhhcqj2h6H2MCbUqe
         ukV1UtWZC6M8OACpoV9yXttMitMZL90Fq3IqgYIUPZHLIkZXXSdaHGkqBqSqvC5M4rVH
         jkbciK2FA9TG/KoLSN1Ujf4KGyfvdOdwURjizKZ3x7oIIokW68J4tIwjvQ1BDOP/yIQh
         AQVFNkR+qh8jX1Jyvpp0PyYqAOmVh1YLBQtLA1P1exBMIIOmY79tS0adKOc0nHGH2ECU
         TJOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TqZRF8z3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d25-20020a0cb2d9000000b0056b6be933e5si11224434qvf.545.2023.02.08.14.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TqZRF8z3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPshq-0007d4-Bk; Wed, 08 Feb 2023 17:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsho-0007Xm-QY
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:14:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPshn-0002aH-Ex
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894459;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lQ6EljoD5QK2A8I8CAE85syLfcXMqsui/fAOwmLyO1s=;
 b=TqZRF8z3ZpR2xOf1wrDtccQ7ed4JUFfVap5HPrU32zSnZvtXQvdYZgSvOAaBTDnin7+C9J
 NQEEUV0OTSildPNrm2PAmiRaXH18f98w8ibhmZxW5PmtMz2Ddx8Ky00+ZMnsVQJfE/TSM7
 FSW6bjeF3gNRj0B99Gxhl99YsZRBJ8U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-9JzPGqIXMKi5w-RWl6QCxQ-1; Wed, 08 Feb 2023 17:14:15 -0500
X-MC-Unique: 9JzPGqIXMKi5w-RWl6QCxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k17-20020a05600c1c9100b003dd41ad974bso101746wms.3
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lQ6EljoD5QK2A8I8CAE85syLfcXMqsui/fAOwmLyO1s=;
 b=HcOC24mTeiGq/I/y6URtNDLp31vajS53qzkMy/yQOIaXr1DBFBz5KKmd2N3h3BJP6C
 EExnQGgf4I0JErevH4SU6Glq2sM8oWn3U4XNV94GK/9Q6/WSljGxswaCOGgqBYesPVz9
 4LKAMMq5Gm64G4MTbHExghLMosN9rQy6O+N+MQeaaG6eQb1OPYvAFkawmRlu599Jt/+/
 3Qil84+JsZaMhhIsUKUZelLlg5LNn3cc6Tc4LHmFmE6h/i46OLApWeCr8It2Q8CT7C2I
 Q4YSF0yUfCm4zcHvW25rdDzt+jiCU4IqxABFVKVNWrcAZqt62eCLLNnw0ApKrY5oAzyl
 IjFA==
X-Gm-Message-State: AO0yUKXqW9PdgbaSm1kJruUP3+QWMq0QFdqbwHJ1FCXQVdBDpq9k4KKC
 gbnE9nsA1eSEVgdfJsU16NIfX2wQvowZgnMlPZTqcg3XrwcHzknQvaxt5sIXGJ+X2qXrDLmJDzN
 i1lgiFQZZgCY+
X-Received: by 2002:a5d:6791:0:b0:2bf:963a:f266 with SMTP id
 v17-20020a5d6791000000b002bf963af266mr8388910wru.27.1675894454398; 
 Wed, 08 Feb 2023 14:14:14 -0800 (PST)
X-Received: by 2002:a5d:6791:0:b0:2bf:963a:f266 with SMTP id
 v17-20020a5d6791000000b002bf963af266mr8388883wru.27.1675894454169; 
 Wed, 08 Feb 2023 14:14:14 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm11708385wrq.91.2023.02.08.14.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:14:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 7/8] hw/arm/virt: Enable backup bitmap for dirty ring
In-Reply-To: <20230206112010.99871-8-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:09 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-8-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:14:11 +0100
Message-ID: <877cwr9558.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c3s4PwO5M/l0

Gavin Shan <gshan@redhat.com> wrote:
> When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
> enable the backup bitmap for the dirty ring. Otherwise, the migration
> will fail because those two devices are using the backup bitmap to track
> dirty guest memory, corresponding to various hardware tables.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

