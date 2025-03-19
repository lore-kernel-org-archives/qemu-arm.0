Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp159563njc;
        Wed, 19 Mar 2025 04:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIDFnp2tKpmObPJVs126ZGPjO24IHyadf5uAwauga7BsfaS4ysyVq6++/aAzrmIqAZFkDJHtO3PJn43w==@linaro.org
X-Google-Smtp-Source: AGHT+IEvUJixjVRdI3Ee1i2iEq/ORlG1fWLuqE+AKpN0WtjYkWkpvLlgKlo4X5TBmw6DCT5lyZZW
X-Received: by 2002:a05:622a:4d48:b0:476:7eca:57e7 with SMTP id d75a77b69052e-4770836c47dmr38267471cf.26.1742383712238;
        Wed, 19 Mar 2025 04:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742383712; cv=none;
        d=google.com; s=arc-20240605;
        b=iKHToldmSoLYNDXj7r5s0T+8ewg+wRu/ODbHUwWZ7f2S4+CVhpt4Fylkh0IU2rUMUE
         ADGf6tg07RhxowUcMlLZgmqdjEDKl63/uCWBmVaA4Bbh0n6ESgUmajmZ7xeFd/PyXAaO
         4aVAq27TYsJuOo6/bNEhx/TkkCBm9JIcpbiJdkLnoyfSCROmGgN2eAtoQfKLKUauq5Fz
         0wKnbTlCSr7OGVe1Kdhk6zuUX1KjsftEl3E6RlRZK2JfPJ/skenZnL6YT077XCAuKMwr
         APSf7RhBPV9Ckvjh2ck08wkQIpbdqKjL5kNVSj4xnYYtJV9YivauV77XuFk+k+GkZAwl
         LtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oyNzqd7uRlWEdC+C90aF6cwKw4OGNgDVSf0fp63O070=;
        fh=opAYyBUDG2h3zEqrg58yXWv3FWorVu+WgikF9NHN6nw=;
        b=UmQ2iJpGz0m/PFwoxXoduCQoRcwJnQX1lD1Jlfl7bX+BXTVQSSYC7XFRutqcYhQCxI
         kODSpgOERGi0yczujjWXBwcPPoZmorcHo3zDFqgUqnOJGIawraOus846LzpYBdHb4xyM
         w9jPtkjykJt5avO2iZ/J1QUREx/Aa+R76MWZhQAdRf0wz4U2xK29APbJcSsYyI55vK5Y
         DlY4vnMHSqkPCCASYlzyj34iDp/YTckzZWuQCYmwibbq4mCD2eqorigOltHvH+W7CDIv
         VaIw7CGypoimzOsrLgQFGhCfri1J+cvxXl4yopa5KyqvEbKr4hTW0JM1zF1UP9dZ1zdi
         lMWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZfDpMXfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4770d16e477si3476201cf.335.2025.03.19.04.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 04:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZfDpMXfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1turap-00035d-Ij; Wed, 19 Mar 2025 07:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1turan-00035J-L6
 for qemu-devel@nongnu.org; Wed, 19 Mar 2025 07:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1turak-0004pd-KW
 for qemu-devel@nongnu.org; Wed, 19 Mar 2025 07:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742383687;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oyNzqd7uRlWEdC+C90aF6cwKw4OGNgDVSf0fp63O070=;
 b=ZfDpMXfh4uv8Ka9tFw+cS5D+XhT2cBLoiONG0KPCXncz4QXEJR7gBX2LIe5fRPQHMxt2xB
 ipzGw16SzakivMVhfLpHqFVPweetYSBI2kxusgDAtMNAFlHbF+Ob/6Pf8fUwuJKXzuC2HV
 9Or4RqyplptfKvOkGPr8Or+Km6GeOvQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-I24dGhwuPeK6lZVWJpNf2w-1; Wed,
 19 Mar 2025 07:28:02 -0400
X-MC-Unique: I24dGhwuPeK6lZVWJpNf2w-1
X-Mimecast-MFC-AGG-ID: I24dGhwuPeK6lZVWJpNf2w_1742383680
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 960BD180882E; Wed, 19 Mar 2025 11:28:00 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.112])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0A1281800268; Wed, 19 Mar 2025 11:27:49 +0000 (UTC)
Date: Wed, 19 Mar 2025 11:27:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 16/24] hw/uefi: add UEFI_VARS to Kconfig
Message-ID: <Z9qqLUJ-1KTKyJzX@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-17-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304124815.591749-17-kraxel@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jiUjYLYQ1E6C

On Tue, Mar 04, 2025 at 01:48:04PM +0100, Gerd Hoffmann wrote:
> Add UEFI_VARS config option, enable by default for x86_64 and aarch64.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-ID: <20250225163031.1409078-17-kraxel@redhat.com>
> ---
>  hw/Kconfig      | 1 +
>  hw/uefi/Kconfig | 3 +++
>  2 files changed, 4 insertions(+)
>  create mode 100644 hw/uefi/Kconfig
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 1b4e9bb07f7d..c4dfe2e7af7c 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -37,6 +37,7 @@ source smbios/Kconfig
>  source ssi/Kconfig
>  source timer/Kconfig
>  source tpm/Kconfig
> +source uefi/Kconfig
>  source ufs/Kconfig
>  source usb/Kconfig
>  source virtio/Kconfig
> diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
> new file mode 100644
> index 000000000000..ca6c2bc46a96
> --- /dev/null
> +++ b/hw/uefi/Kconfig
> @@ -0,0 +1,3 @@
> +config UEFI_VARS
> +	bool
> +        default y if X86_64 || AARCH64

RSICV64 uses UEFI too, is something extra needed before it can be
enabled there too, as it would be desirable to introduce it on all
UEFI targets concurrently.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

