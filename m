Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp701785ejb;
        Sun, 29 Jan 2023 20:43:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+uU/kWAnyFWFKTejgKGOM+T31k/G2v2dVShWqzQriRYQvqBFdaf28KCY4H2bL9T+c8zvhZ
X-Received: by 2002:ac8:59c5:0:b0:3b8:2882:58e6 with SMTP id f5-20020ac859c5000000b003b8288258e6mr20026490qtf.50.1675053809826;
        Sun, 29 Jan 2023 20:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675053809; cv=none;
        d=google.com; s=arc-20160816;
        b=tT7HvtOZJhS0w2wxsu4hWUd6kBf0f9k5FpK8AqeBLn0txyY8stxs1wRqcsXLimnlQe
         EILxOT7zcdolUfXvXHCBD/Et3hC1Q3W51K6m3um/+LEnKixaFbRLhhumVH0JLkXybLoe
         Ooomoxr+5owjrHUoHJwOn6QN7YEsO2z9EKo768hx9puURexaKcccxVEy88XkCrCKanzt
         yrcp02MdVx+3hkQsiYFEQvKN9Pw+pNpvQxRt6eTa01xzXT1kdizz31EuFsjg3VquvvnT
         yRwBX9309S+DcOeUK5nNSUaVewtt+jExIQGdpfxJC9NN88mhxFcHRaDhMoCyJooASrRu
         uO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=VePif6ytaM14VaX7etyKS2ygHwhmrK8RRbPfy7Ue5us=;
        b=WUWgwacKvlkFjAoE+nEad6ktLlfdn7jn3eJKFF6HD501wk8cNPX6/5f72KIfIpdga8
         fCNC6oCKNv5sUXixGGmbzuOLrzN63rEZUQMIazxA/S7M+QJAsx1nHTDAIf5zEiDxuE1n
         8CwZjS2bL5YX+at8+TDWLnRrmsQAx/KQ6SfxRFCDIKeF0I+ZYA5WvApA2ZKnkJAaK567
         S7WLlzeRxTFycmYJIYCayCuekCfO4NYANy1uEUq1T2olGE2nLxSdt4xHTU8PS4LhWMee
         yHL42vmruUKfOybDB2ofaFAvA03u1hFQxLjnEI7BUIFGBzpRyMEXIN2rYztZHArM5l5P
         OqEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UtaFki8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020ac87049000000b003ab5dfce4a7si4398874qtm.734.2023.01.29.20.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UtaFki8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM0j-0001EA-Il; Sun, 29 Jan 2023 23:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM0i-0001Dg-80
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:43:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM0g-0005Zv-SE
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053793;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VePif6ytaM14VaX7etyKS2ygHwhmrK8RRbPfy7Ue5us=;
 b=UtaFki8AdZPQM12MQb1qI/dHJvjb7pL1DsaGeT2sOS3NcPvoI+ueTxM9JW+CAQnBW28WYJ
 nv5lksbf35yHUCUXnvomXF1SpSRkE8Bq8OTzzY6TJTWjN6G+tA93pbf5mqteNS4KoLoARU
 VMmxpbOcEAw1uU1tgFQAPFF/SVW5snI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-Ja3JoviaNGCNwdKc__s6QQ-1; Sun, 29 Jan 2023 23:43:12 -0500
X-MC-Unique: Ja3JoviaNGCNwdKc__s6QQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so1337447wms.8
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VePif6ytaM14VaX7etyKS2ygHwhmrK8RRbPfy7Ue5us=;
 b=Cg+7IdLf5+jK+mIjuXDJ1F1eH+mNRXJI0jMHqtwnDSKuFn77XKQk15wB8rbDs/9z5Z
 +zn5CEqd5xMBA1VQKl2lQFC+5aJpbvG5f0q19Wi8KuSS1PlXRkb9a1hHXRuhSLqbmuI+
 CmdudS0iHMExeGP4DvjVYk0KWNX6OFkqWjf+SMFq3Wo6WB369EWcCJeja3z0nLNOn67C
 ZTxeUgC09gUjxrdeijWIFYfpFhmk6Boc7bKK440NpcGlGBfq3Gsfxp39oQEHQ35c/e/4
 61tdj+g0VkvOEZhsJ/aqHXa2qKkZB7kuANvF5g1sgcP+cpMsZbdt2jK4K+JpoFhScp9y
 7cOQ==
X-Gm-Message-State: AO0yUKVFJGewuw4JuQcOdaRR6ze5k5hieRD3wIn9mJAWYwpfAEQNNCwg
 YupfYj6xEW+gmnz71PWyrepHKKJ+/bJD6iI2YqAvnlEnHcU2xky+C8rAinQvD9oYe0lDvziSenw
 Q6s3Ykv46WRkP
X-Received: by 2002:a05:600c:3b8f:b0:3dc:4633:9844 with SMTP id
 n15-20020a05600c3b8f00b003dc46339844mr8918460wms.17.1675053791637; 
 Sun, 29 Jan 2023 20:43:11 -0800 (PST)
X-Received: by 2002:a05:600c:3b8f:b0:3dc:4633:9844 with SMTP id
 n15-20020a05600c3b8f00b003dc46339844mr8918442wms.17.1675053791434; 
 Sun, 29 Jan 2023 20:43:11 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 fl22-20020a05600c0b9600b003d1e3b1624dsm15700114wmb.2.2023.01.29.20.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:43:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 05/11] tests/qtest/migration-test: Inverse #ifdef'ry
 ladders
In-Reply-To: <20230120082341.59913-6-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:35
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-6-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:43:09 +0100
Message-ID: <87edrcmy3m.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3+QZta7lqUXP

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> This slighly simplify the logic, and eases the following conversion.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

