Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4458955ejc;
        Mon, 6 Mar 2023 02:03:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+smog3wik7KC/eF5FX5TZquYKlTWR6eQhfSUaZuzk3ZguOKJk5uWmhx24gFjpiVGysyyFp
X-Received: by 2002:a05:6214:19c5:b0:56b:fb30:49c6 with SMTP id j5-20020a05621419c500b0056bfb3049c6mr16641363qvc.50.1678097014919;
        Mon, 06 Mar 2023 02:03:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678097014; cv=none;
        d=google.com; s=arc-20160816;
        b=Gn910bZ5+I0gvSqhJh6GQbDzzUDop4dW1c8Kp1YWkS/1VeOEByYBXt5RUUmJmBJoV1
         9dE5AyNrp9gmue8kKZuspznaG7vxTNYhG7D8EP3BGkqCU5KxoTfs0nAavR5oRFAHE4i0
         8AldrTG+yAmRuWECqS/kN201rz/bvieflOZaKrN0GEXdStBPdERlZ4JZ8z6f10YysMHC
         XSUoTtW9x6QgLvxAo6+IE3//U3572lIgvv4+Auo0/9FviDJZjSGn5IA9JqZdrUp3SPzA
         FqwxJ9w8+urQrpFx4f8+2sRMRnx91AOvy83srGdV+P/680pWIH12xF66d1/JorI4LmDu
         5HQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=k11QQVc4eoDz7r2I/WbOrzzgH/UDuom+B/F91BRYc0I=;
        b=FoMoAyykuCETb2pbtHe0eK/YLaMZJ05xSAdKTXx7QKXAotpEOnwmqgDkgtE+VZGMCI
         N+pjwD5CFnYc4GcXY2PZ7WINxNZjuHXZrEH4Ptqx10SAHZfj79RQUd0oALP+0pj899tT
         wRHc1TCQ3ILjsP0wmzIeCKoFuB8ZK3Z6f9mj0Tfmn/cIQAbohVa+snoPhKfLh6crdemM
         j4nwb+VxWv/YTJlaEHNvbdyCfkM2Ax08It6YeIzI+/HjEFnsT52RT5/bmaSvl6BEvEPi
         +hb5V4oTHT7NV3T3uyEvyfbcPIDeruxls7i9JPaU+rZvEE+JONgFucAwarj7X5Ndlf6t
         PT3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G8DMO83j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05620a424500b0073b9e507487si7684303qko.553.2023.03.06.02.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 02:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G8DMO83j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZ7gU-0004up-3r; Mon, 06 Mar 2023 05:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ7gK-0004p7-Cw
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 05:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ7gI-0008Ak-B0
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 05:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678096977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k11QQVc4eoDz7r2I/WbOrzzgH/UDuom+B/F91BRYc0I=;
 b=G8DMO83jo4g1VjWBGUIDKqJDe0iARvm+IX33h5qzzPE8lBk9OTDnyG9IeLMUyHuvWz0zju
 hcRL3AeytAw5WQp6URDVIBPVVqNLY/4N6ovkUrT1NnT8GlONDdZQ48Bc4UfQ/vsBl+iA/Q
 tTm6d8opw7OEbqP2qbblbm182RXLxjI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-1RrTqLt0OAuw2AjWKT97PQ-1; Mon, 06 Mar 2023 05:02:55 -0500
X-MC-Unique: 1RrTqLt0OAuw2AjWKT97PQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w7-20020a056402268700b004bbcdf3751bso12932191edd.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 02:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678096974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k11QQVc4eoDz7r2I/WbOrzzgH/UDuom+B/F91BRYc0I=;
 b=vMFkno18qobyFwA0cmg7i61HR566WQRf3+beZrxNwCeTnaQPq3NtJViEAhDnVNjKJH
 LXKZRBtjp1MCyenZd41J2SRi05YYW1zvNLpIigp05eEW+ZBgN+SQhCzHVh2k6mt5Qaq+
 GO7Ulry/dsxNBSG42ubE/jGRxHrAyMS88j+uWZiafMT+fQBuKEdbcRqqedxSyDeEapQu
 F0JIPk67mUtIR8/iqCAFHL7P8wyTxZHnrVudzWuQxZQVA2uGu2AFRl/3t1qfn4pOfTxU
 tl4RYlXfa4aax+baM8VvzhcBr4Dvb+9sPZYcm/zraYyR4J4EsdWHIZzZpn8d4rAFDfgX
 D3rw==
X-Gm-Message-State: AO0yUKUeKC+rVvniMdcCoqLlM/CO9CD8DKtLbLiurR0bXg3l//TDUIsc
 oR6/n7ijKEb94Zt4LQYf7LYzv/bPbZJU6tAMcGdD0HQBvL6cjfNbRD7C7+mOT3D/0We76TU+X3r
 3MNw4ms8su+Qv
X-Received: by 2002:a17:906:9c8b:b0:8b1:76dd:f5ef with SMTP id
 fj11-20020a1709069c8b00b008b176ddf5efmr10217849ejc.5.1678096974786; 
 Mon, 06 Mar 2023 02:02:54 -0800 (PST)
X-Received: by 2002:a17:906:9c8b:b0:8b1:76dd:f5ef with SMTP id
 fj11-20020a1709069c8b00b008b176ddf5efmr10217828ejc.5.1678096974463; 
 Mon, 06 Mar 2023 02:02:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p7-20020a170906140700b008ce5b426d77sm4439612ejc.13.2023.03.06.02.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 02:02:53 -0800 (PST)
Message-ID: <a9ac850f-ffd4-0771-147e-bf7385483043@redhat.com>
Date: Mon, 6 Mar 2023 11:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
 <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
 <CAMxuvawL9VEGC5HL9OMwXhxeVY_qSKFfORsMaW9OeV=tQ0OH1A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvawL9VEGC5HL9OMwXhxeVY_qSKFfORsMaW9OeV=tQ0OH1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sEyBq4wC9hn9

On 3/6/23 09:08, Marc-André Lureau wrote:
> Great, thanks! (I suppose you'll drop "RFC: build-sys: add slirp.wrap", 
> and perhaps queue the other meson/wrap series instead)

I don't have time to test the dtc fallback in CI, so I'll queue only the 
first three patches and note it as experimental in the release notes.

In the next release we'll probably have pip support in configure, so 
perhaps we can make the --wrap-mode option conditional.

Paolo

