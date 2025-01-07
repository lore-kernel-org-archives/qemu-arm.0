Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp250019njb;
        Tue, 7 Jan 2025 07:49:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEx+gnpErWm9pZXua7Gll52LUDm7aY4WhRDAxFznzhUwSNQJ7K4aLDy1irJv8y7NpLgjmOG3TQtIAvDg==@linaro.org
X-Google-Smtp-Source: AGHT+IH3g/kUBjTadD3u4oJGeZ4t9/E/3pqZEyEy50feMWPim4k+jWyY4F8qvO4L2+XwkC3b/mx2
X-Received: by 2002:a05:6102:dd1:b0:4af:3973:6b22 with SMTP id ada2fe7eead31-4b2cc4684dcmr49253344137.22.1736264989948;
        Tue, 07 Jan 2025 07:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264989; cv=none;
        d=google.com; s=arc-20240605;
        b=lD6LV2Hby1fBkP4AfeG8DfHUnm8UWkzZr6tid+PX0lYb48k4Q+wTVQq7fuPIQpscRh
         UDSDgivVS+LPDtMVO0CsI3A8AxD6PEY6Mecz5j2JTppTan7v1gvVGSOxrqnrxXBadk21
         NbQmgBunRcxU62Mih6ZranWUYLhVoHZ1kcOrxPz+S6c0hLQhnJZ7OgapM7amS3tEMi0i
         I5TbcidlVtyMcQVA9nJmu9Kz8a8TqB7VnvrFIc2ZKAmC/5koC1uCtEMYgy6VU+r9PZYi
         Qn5seVLtcRudhAkASePrhCWCwHWc7Zu+nScYhgEjWKpWCsnB8cm7VvBP3G7RK3mqNbwa
         2Lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=1WumwGpnFuIBztcl4qjZngxaSVLAmn1Sgu72KHgiURs=;
        fh=BfvZw/9bpnLZf0cfXo0FxrIEf6q66Di7cCv6MgwgcfU=;
        b=bJTtuFznklXgB/82S5q7CXwqbfm8AILsFYNt+KyUv8JkkeXAMdYL3Z6DjTlCR2FC5l
         WMda7556WO8eSIAIfejtTjCR+SHneNNCQ+32SbUUMm07mX/HleFKGLM/Tm72RezZ5W+l
         qVBoCmYYBWCmOeICBnakXkFcoQc8zH04GWiASRzwu5MPBeJ3R7zbjJDB9HbF1Eh2tmmt
         Fy82UuNmTebJF3oibN5N4CmIWgVs7oHUm3L2PxckD/0Ke3pVAbz9kj7wGfzvYpfWSSI/
         ljaCkKZR8vKhX7SBb/T9NoIUxXARTSlRLnurHU5rm0N/o3nG4wjjeFmdpPjJbOZUDQz7
         bxYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f1amtqeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bfb1ddb9si3658321137.222.2025.01.07.07.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:49:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f1amtqeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVBpl-0004ef-L1; Tue, 07 Jan 2025 10:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tVBpf-0004dx-C5
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tVBpd-0006qu-O2
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264964;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1WumwGpnFuIBztcl4qjZngxaSVLAmn1Sgu72KHgiURs=;
 b=f1amtqePMnwc3sGJcjCzraEDZWLmHvqlbymbFWWeeswailY7IJ6bucGwUl8MXwlOP0z3EC
 HQBnxBbi6pavS2qHq6OweV/9frhW1/5hNTSos/en0VNk1fwdIu+jmCPnNQdspM0s1HQ16g
 jbubqewvcueCP6P66XRGSlzMSX33KrE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-Lh7fb98aPGqSgSuuDzKFuQ-1; Tue,
 07 Jan 2025 10:49:20 -0500
X-MC-Unique: Lh7fb98aPGqSgSuuDzKFuQ-1
X-Mimecast-MFC-AGG-ID: Lh7fb98aPGqSgSuuDzKFuQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0193F1956089; Tue,  7 Jan 2025 15:49:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.64])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 65F391955F57; Tue,  7 Jan 2025 15:49:12 +0000 (UTC)
Date: Tue, 7 Jan 2025 15:49:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, graf@amazon.com,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 13/21] hw/uefi: add var-service-json.c + qapi for NV
 vars.
Message-ID: <Z31M9Vd37_koWggu@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
 <20250107153353.1144978-14-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107153353.1144978-14-kraxel@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TzOaq/ewtdmn

On Tue, Jan 07, 2025 at 04:33:40PM +0100, Gerd Hoffmann wrote:
> Define qapi schema for the uefi variable store state.
> 
> Use it and the generated visitor helper functions to store persistent
> (EFI_VARIABLE_NON_VOLATILE) variables in JSON format on disk.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/uefi/var-service-json.c | 242 +++++++++++++++++++++++++++++++++++++
>  qapi/meson.build           |   1 +
>  qapi/qapi-schema.json      |   1 +
>  qapi/uefi.json             |  45 +++++++
>  4 files changed, 289 insertions(+)
>  create mode 100644 hw/uefi/var-service-json.c
>  create mode 100644 qapi/uefi.json
> 

> +void uefi_vars_json_init(uefi_vars_state *uv, Error **errp)
> +{
> +    if (uv->jsonfile) {
> +        uv->jsonfd = qemu_create(uv->jsonfile, O_RDWR, 0666, errp);
> +    }
> +}
> +
> +void uefi_vars_json_save(uefi_vars_state *uv)
> +{
> +    GString *gstr;
> +    int rc;
> +
> +    if (uv->jsonfd == -1) {
> +        return;
> +    }
> +
> +    gstr = uefi_vars_to_json(uv);
> +
> +    lseek(uv->jsonfd, 0, SEEK_SET);
> +    rc = write(uv->jsonfd, gstr->str, gstr->len);
> +    if (rc != gstr->len) {
> +        warn_report("%s: write error", __func__);
> +    }
> +    rc = ftruncate(uv->jsonfd, gstr->len);
> +    if (rc != 0) {
> +        warn_report("%s: ftruncate error", __func__);
> +    }
> +    fsync(uv->jsonfd);

Although the fsync helps, re-writing the file in-place is a ad idea for data
integrity on host OS crash. Especially if the new data is shorter, we would
easily end up with a file containing old and new data making it unparsable
(assuming the parser doesn't ignore trailing data).

I'd like to suggest the write to temp file + rename dance to get atomic
replacement. The problem with that is that it hits the DAC/MAC security
restrictions we put QEMU under :-(

My next best idea is to re-arrange things thus:

   lseek(fd, 0)
   ftruncate(fd, 0)
   fsync(fd)
   write(fd, str)
   fsync(fd)

so we should at least reduce the liklihood of getting a mix of
old and new data - empty file is better than a mix of data.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

