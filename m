Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp61873dlb;
        Tue, 27 Feb 2024 23:30:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVW5S25YJjwbX0zQrDFUOb2IhwLElcLFhFdALbzSLPy0OhoMc4ZQ36i9/A6+IQ7jOHXgb1kFa34wSm4rI7YR6JwGjP9Px3M
X-Google-Smtp-Source: AGHT+IHLCaNcuKk8QdNyy/JEvzkB/b6ZEJWX7dKvrYjJ8oBEWVVivnd11bNjNMIM5hUwokAzf3vy
X-Received: by 2002:a05:622a:393:b0:42e:8f35:cd6e with SMTP id j19-20020a05622a039300b0042e8f35cd6emr7502512qtx.9.1709105451566;
        Tue, 27 Feb 2024 23:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709105451; cv=none;
        d=google.com; s=arc-20160816;
        b=Z1PRbPO4qEyEmmkcU3yQvjTyCUJeNHdxfzeLeDCxXFUEiSZh6dDA3JeCN64GBnn2EN
         nJJZJX8v8H9spwX8aEFnw2OtAtTQwPcOzWv2fi2BvridZ3M5YX8fEI57Ip55WdFgSmYG
         zIB7pGcVRG3aiwp2LBw1hewLuQkEOhBQpCHpEev6JklGVJ68DPsw7vLLmiLmqPbsFrGz
         DC0hZqZwwuJd+d7uV3VOrZBrmKH2tRQWo4iQRfikkAmffOvAeTH5Qc9UYEkRN2vsqbGe
         RZclDGt7i9DmMztyEm1/Nk6ihcMMnVVoSLVDw/eZ1RwWknM0eeQWOIUY7jE47WplITVH
         4w2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Fsb6wqWPtLgyEJyteYP5HWHeRZOILnjmTS6NLknJUXY=;
        fh=NiGDwbO1ayaUaBLbj84G+lw60R14THkZZiKWbwHzwpc=;
        b=WY7CireiL+KwXtx0D7It2qWBcddKWUA/Ww59EkYAmEntGEP0Uebv9w5M01/0iFaPML
         +UQQZ2NKYFKJijHI0LGNFh5gPzJc1R+Fz847jJNnI+B5evIoJ9UdscpUu9Lpcy3GLYtC
         2Rcaj1wkgujwaxnF8Wfmb6JyRjyhzrzPDv9ZkxD9RaHAju58GTrlE6cZNh6oiL8AwOZn
         Ib5UdsyRsQYaqrgcprTQ4bV3BNKdk19WfRNc7tfkkNkZpOWrHTwCB3d9b6EE6TkFCyZV
         tEOl/beYUE6ktGz7Jq6hVCb7sXO8/xe1nq7O8772vHFiVODh1IAEzUBQXJOwpBGSN6KW
         X4oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U3+I8PVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020ac8524e000000b0042df06189absi9099035qtn.415.2024.02.27.23.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 23:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U3+I8PVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfEOZ-0003gd-VQ; Wed, 28 Feb 2024 02:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rfEOX-0003gK-Bj
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 02:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rfEOQ-00009D-JB
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 02:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709105416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fsb6wqWPtLgyEJyteYP5HWHeRZOILnjmTS6NLknJUXY=;
 b=U3+I8PVByQWSxGbTvQRwUIIXoB9YW/vuKxaKs8fHF4Fytx59IFdLYNzZLzMZTvAlhy64et
 AqtJBu3zURV7LsSA67+JxeMO6fkPMkpJm4vE5NIoZzbdj4wIoxB1XdITRElL0iJ6hqRVAp
 Po0/WtjKz2V5G8jtZZ5mr/4TFQ3tXfA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-ziVIXGdjNku_CInty1az6Q-1; Wed,
 28 Feb 2024 02:30:14 -0500
X-MC-Unique: ziVIXGdjNku_CInty1az6Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B34D3806703;
 Wed, 28 Feb 2024 07:30:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CAD9492BC6;
 Wed, 28 Feb 2024 07:30:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3979921E66F9; Wed, 28 Feb 2024 08:30:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,  Fan Ni
 <fan.ni@samsung.com>,  Laurent Vivier <laurent@vivier.eu>,  Alistair
 Francis <alistair@alistair23.me>,  "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 1/7] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
 cxl_fixed_memory_window_config()
In-Reply-To: <20240223085653.1255438-2-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Fri, 23 Feb 2024 16:56:47 +0800")
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-2-zhao1.liu@linux.intel.com>
Date: Wed, 28 Feb 2024 08:30:11 +0100
Message-ID: <877cip3v24.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: p2Fc8NxNW7V8

Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
>
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> ...
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
>
> But in cxl_fixed_memory_window_config(), @errp is dereferenced in 2
> places without ERRP_GUARD():
>
> fw->enc_int_ways = cxl_interleave_ways_enc(fw->num_targets, errp);
> if (*errp) {
>     return;
> }
>
> and
>
> fw->enc_int_gran =
>     cxl_interleave_granularity_enc(object->interleave_granularity,
>                                    errp);
> if (*errp) {
>     return;
> }

No need to quote the dereferences in full.

  But in cxl_fixed_memory_window_config(), @errp is dereferenced in 2
  places without ERRP_GUARD().

  In these two places, we check "*errp", because neither function

would do.

Same for the other commit messages.

Hardly worth a respin, though :)

> For the above 2 places, we check "*errp", because neither function
> returns a suitable error code. And since machine_set_cfmw() - the caller
> of cxl_fixed_memory_window_config() - doesn't get the NULL @errp
> parameter as the "set" method of object property,
> cxl_fixed_memory_window_config() hasn't triggered the bug that
> dereferencing the NULL @errp.
>
> To follow the requirement of @errp, add missing ERRP_GUARD() in
> cxl_fixed_memory_window_config().
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
> Suggested by credit:
>  Markus: Referred his explanation about ERRP_GUARD().
> ---
> v2:
>  * Add the @errp dereference code in commit message to make review
>    easier. (Markus)
> ---
>  hw/cxl/cxl-host.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> index 2aa776c79c74..c5f5fcfd64d0 100644
> --- a/hw/cxl/cxl-host.c
> +++ b/hw/cxl/cxl-host.c
> @@ -26,6 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
>                                             CXLFixedMemoryWindowOptions *object,
>                                             Error **errp)
>  {
> +    ERRP_GUARD();
>      g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
>      strList *target;
>      int i;

