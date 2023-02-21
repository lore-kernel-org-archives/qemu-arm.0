Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3292451ejb;
        Tue, 21 Feb 2023 06:17:01 -0800 (PST)
X-Google-Smtp-Source: AK7set906pDyc6JHPjSWUGmQPBdz+Oh6HOGF7zYnUCF9irH4Mn26frhIWs4W/QiB4X1mbHOdRVT0
X-Received: by 2002:a05:622a:548:b0:3bd:16cf:2f10 with SMTP id m8-20020a05622a054800b003bd16cf2f10mr27362295qtx.35.1676989021411;
        Tue, 21 Feb 2023 06:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676989021; cv=none;
        d=google.com; s=arc-20160816;
        b=LwHpEeAG0s1BM72I6Fc/TR6yy53n2cC/1ClyLtmS1O+1eJd43Rk/DjfxWs7XAiiT5b
         tNYNNUNDmpjTzICQySQH2fznN94hXoO7JAR9FpX4i3xULufkfJTmoT3ecw7QnNs1Czxh
         tG163+DZh4nmx8uf7MiM+JOzmBQGtmrFqW+DONmHsBzcwdfzqKq6zXO888g3KOhnr1gY
         Y+Nab2DvOL8t16Xbg7UKyundrtbkco4sBxs6mAcPdycFyEfG42qAZrDowVHJpat9+3bi
         TTT4cnR17+7USUpqVRtC0YdHnZ9ED6pl632kwMWosy+0jn8PTWFwKq3y3f7fw7wCdGFF
         hSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CmliDIUuWuowENEMGaDzr3ZY1ANxPbxbcJPoZMlbKRk=;
        b=d7dmOOmDCKle0HFQA7gzB7NyV+3Bw0aNG42vRkAGhb2pwGSwRdYMz1StlDozw7GPLP
         QyjDN1DEBjZ4hlesf58/BBtR6QJmqMQScEYf5CmW9KshjBBMdHxEAckN81w8ZytajI2g
         lQQ68QUvIdSbP1R2HktwGaAkDSvuf8D3LeO+05hXH9EXbT4OWqTzd3C1RqdUZt3dENiD
         y5BVWy6PByCyQPk5GDtxFYRL6zZkt7XhV2wscEDh+oLnciK6OuJwRRkwNdvSTU/fDY36
         zS3zhtSpMXTxz7qY/PwwS30QkaB6KfQujXnyV7Qfaa6PW8+jYmHmFffUKJadCv/j9GZU
         o67A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=giFokozv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020ac85b51000000b003b9bd1f1dedsi12096816qtw.612.2023.02.21.06.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 06:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=giFokozv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUTRo-0006gv-5p; Tue, 21 Feb 2023 09:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTRn-0006gG-0k
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 09:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTRl-0007xC-Hz
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 09:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676989004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmliDIUuWuowENEMGaDzr3ZY1ANxPbxbcJPoZMlbKRk=;
 b=giFokozvp8AFdKczxEjpTYGNOn/NdRTIA7Dz6+srOQi4gDEUDZ7+k5uQvf47PiGodD3vN+
 tjXZJyurOjlFuIIfuptuKsml6Yuy9WGSI1ak5FNB1AV0yGckDL3erqam5p3pYXAy8DaaW8
 8WcXlkkTHCGceuF9hyqvWDqFI1hoTmM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-5jhme46KOL6sFLVao4EbrA-1; Tue, 21 Feb 2023 09:16:43 -0500
X-MC-Unique: 5jhme46KOL6sFLVao4EbrA-1
Received: by mail-ed1-f71.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso6027665edb.7
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 06:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmliDIUuWuowENEMGaDzr3ZY1ANxPbxbcJPoZMlbKRk=;
 b=v7h6NQTzP44d0TMI2ymZGKbnsQVMA2Xd/Nu5kfZptubbxpz6nw2GGSiQ7jic3jSrQv
 vYcfRlqEqnh7nq9avTlJdA1gCmaRucsR94pCzwKtCZeYp61cY/fM8hNpn+HiUC/vo8An
 bAUMJIrSrJtocNoJPX99GFDHZSxAo/8ZU1Cp1YQI2K8Fqu5NT33ub1YFPu1JWeTRqhHG
 9z7RL17HNhgs+dD24zmvikdmGlx6/mgHRBoxu1tOBSpYDPBoruL8BQdV4yQmGWify3N0
 w0gZqh3yP3Q51HS27wetzArXN6DOGQ15CV/KjDsU9VRL9+aYe91c4PxulGJIBc4wgogs
 X6Mg==
X-Gm-Message-State: AO0yUKWJ7gDhko+tE75Nu7svaTFZ0QTW0A2V48FN8rxFVsENTdKdgNsu
 HtHK5jZtuC7ENe/Xt1AjL9zhgDIB8VKUu+QBTtz9brshna8q4JGgriDjm+MIKXm0oKr5KvR/+Ls
 lk3rlYmLmSmT8
X-Received: by 2002:a17:906:805a:b0:8b2:7534:265e with SMTP id
 x26-20020a170906805a00b008b27534265emr14401098ejw.58.1676989002583; 
 Tue, 21 Feb 2023 06:16:42 -0800 (PST)
X-Received: by 2002:a17:906:805a:b0:8b2:7534:265e with SMTP id
 x26-20020a170906805a00b008b27534265emr14401068ejw.58.1676989002311; 
 Tue, 21 Feb 2023 06:16:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 f21-20020a170906049500b008e36f9b2308sm240924eja.43.2023.02.21.06.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:16:41 -0800 (PST)
Message-ID: <7cc74666-df5a-792a-4f18-657b5281a68a@redhat.com>
Date: Tue, 21 Feb 2023 15:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 15/16] os-posix: remove useless ioctlsocket() define
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
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
 <20230221124802.4103554-16-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221124802.4103554-16-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 2jaf7OteNcw4

On 2/21/23 13:48, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The API is specific to win32.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

The idea was to use for socket ioctls that are common to POSIX and 
Windows, but it turns out there's no such usecase.

Paolo

> ---
>   include/sysemu/os-posix.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
> index 58de7c994d..378213fc86 100644
> --- a/include/sysemu/os-posix.h
> +++ b/include/sysemu/os-posix.h
> @@ -52,7 +52,6 @@ void os_setup_post(void);
>   int os_mlock(void);
>   
>   #define closesocket(s) close(s)
> -#define ioctlsocket(s, r, v) ioctl(s, r, v)
>   
>   int os_set_daemonize(bool d);
>   bool is_daemonized(void);

