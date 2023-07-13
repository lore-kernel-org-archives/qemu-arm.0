Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2690689dle;
        Thu, 13 Jul 2023 05:46:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHVjmrFE4qpR+f/3Bah3mj+MBPDLlNP9jCG4jGJ3SAdrR7F3l6Gl8V5DY3VDdQ0WNRr8pT9
X-Received: by 2002:a05:622a:144c:b0:403:a77b:1525 with SMTP id v12-20020a05622a144c00b00403a77b1525mr2330954qtx.8.1689252402286;
        Thu, 13 Jul 2023 05:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689252402; cv=none;
        d=google.com; s=arc-20160816;
        b=r9GCkIDJYtEb2LllOI6J4M6ySXWvhJV+13hvccH54+jYc/gYEC/QSp50hmiwostQG/
         I2x3LnHH5aPdI5nJwET2nM7Hxe/TMghhvoR6LZY9dYs17iZqhqchcTyLLncTg/wzEovH
         i5Til6K8A+/Tye5vFC+cjdJFJBhh8MmdbGmaAdyrX2M3Q3RN9GdWSfMgx3gPNAbOD+qp
         X8wOlQ6MJYj41E1Oxboi/IbdGBjaqWNftRg7ba/aVN2FgwQEzI/JFbg9q9ZdyoJg1t0Q
         nOnlHmD/pJpa/oooeBW7hPdBlEOnUqwPgPY9cFa2rMjpc7hKfrh0adNgTwF7fGOyBnnf
         hTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Na+kCnNj/UTr9FDqRKxyFnSiNymAfK65QMKbN71Qyak=;
        fh=ThdayXRVRJUx7ltcppx5xXhqPhfies6nE/QCuX2PNuI=;
        b=zkB4LiL6W6KCCbzg/YtcPFMJf21SmKLfUl0Eh36hnBa4ELvyeLXa+N4MBO9OKlYXTK
         3u+Lp1HI0RGg3i6BOR8EnMwbVVnCDlSmo0hf2LXOv9mEGQzElMu5UWOsxAHbM75/g5oc
         BcGfM1vxKAageKYnN9BEkgv+9UhTD6a9IZruqcug4zHvujdlA21cvQaFi7vZqOiilIrb
         IiCKHdahttQNYqhzXdydAZnVqnGhNGWtanGsJbASbSMcqZG1zJ0Bi00RpAkMNll5W4sp
         EkCZIZGiJRTZCqLJErbF1skd3/F1d5HhOKWy5mqaNxIMoPnY2c38m6AZmIYFhnonv30T
         tabw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhNnfebO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020ac85f92000000b0040202e92e64si3036504qta.31.2023.07.13.05.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 05:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhNnfebO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJviJ-0007em-FL; Thu, 13 Jul 2023 08:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qJviE-0007Te-CC
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 08:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qJviC-0001ZZ-Pe
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 08:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689252384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Na+kCnNj/UTr9FDqRKxyFnSiNymAfK65QMKbN71Qyak=;
 b=LhNnfebOR8Rbf1Iah5bApAzhTgBa03eWp3y5E5x0uD9xIozhFjBBQ8ezz56I5Uii5/DDjE
 2UwtMBJQUHtx7qyfrQwJPRJ8BYlRPWzwqVOjadYB7e22RgMWeLZsUDrZsyP2cS7t/VRZbw
 FrNusZxzo+idkv47Ug+l97u2urQvY/E=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-RTE30MPEMxClsO-c1fetIg-1; Thu, 13 Jul 2023 08:46:20 -0400
X-MC-Unique: RTE30MPEMxClsO-c1fetIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A439429A9D42;
 Thu, 13 Jul 2023 12:46:19 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39953C1ED96;
 Thu, 13 Jul 2023 12:46:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH 3/3] hw/arm/virt: Support host CPU type only when KVM or
 HVF is configured
In-Reply-To: <20230713054502.410911-4-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20230713054502.410911-1-gshan@redhat.com>
 <20230713054502.410911-4-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 13 Jul 2023 14:46:17 +0200
Message-ID: <87o7kgq8rq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +ElVL7qVfRR1

On Thu, Jul 13 2023, Gavin Shan <gshan@redhat.com> wrote:

> The CPU type 'host-arm-cpu' class won't be registered until KVM or
> HVF is configured in target/arm/cpu64.c. Support the corresponding
> CPU type only when KVM or HVF is configured.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 43d7772ffd..ad28634445 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -217,7 +217,9 @@ static const char *valid_cpu_types[] = {
>  #endif
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>      ARM_CPU_TYPE_NAME("host"),
> +#endif
>      ARM_CPU_TYPE_NAME("max"),
>      NULL
>  };

Doesn't the check in parse_cpu_option() already catch the case where
the "host" cpu model isn't registered? I might be getting lost in the
code flow, though.

