Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp306757njb;
        Thu, 8 May 2025 03:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0HrMrK1jAr3nEaVf626l3QPqwsSZs8iQY30W4mkoSarepJlDQ9CD56Tt5zCyMrlYK/0MjTXaRf2G42Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEqpnG76XrtpRmXzKDZ86k+Di8W/s6Vb7JaUMpmy3YuYiu3A96Wxp7/nsW2ldA/kjzQkZiI
X-Received: by 2002:a05:622a:138b:b0:47a:e0d6:f97c with SMTP id d75a77b69052e-4922777028amr104208351cf.37.1746698779273;
        Thu, 08 May 2025 03:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746698779; cv=none;
        d=google.com; s=arc-20240605;
        b=RkPwnHGEPmlPFCZNbxM74OgCBdlpjLenMuvo2De5rySRdz96JOY1yCELCze+saJYLo
         d8Ywyi1T/BcsJKbmd7FHKz4zO1oR95kmMo445MjNg2tBTv1+G31jrXAjsQCxiIWmgLqn
         gdtuW35jRHzbMw0Zjvxks78QW6+6WJrYJd1Q1T2ceAXdcn+QieZsX8612pluAoTmqCb5
         mGx0Z3w+pLlanJrQN95G5Uhs4hxnpak3nbZvP7yv1F/T24Blaf4RoiNU8f9f5Ek5FFdL
         iALpThSam3NkudFTcTE8j+VgGvRfm2kqQIy68tUlfy98fWWOoSEJ9DuZX8sjS/APoiCz
         nc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=eTuRElDskZ0rm9oY9tFKzYq8CqWH0wRRX2ENNPuhWMc=;
        fh=pz2HMgf0xWiYOUFL78B/auM+XebwkVh+GXRci3ROixM=;
        b=XmbrlB50QQHa/2njjocWAvnXRVxBbw3awL7Z3s+PLWHhnhy8C1IV3ZL53p8/+ijhYE
         S8YwIDDxyGmyS7fSZh+SRXe9QAZ06YRgJz9RMA9ntRQzdC0Mw23gOFMY45dZCJ+sZuTh
         1hPYr5+X8jeLUrefDoHgiQZ6anj728kHoheu9y8y//ToZISoISKhVI5PVxMzZhqQKenT
         ivYnZGWyOxFdhfpHgrXs5IZzfQ2UvVAf3rkYkG1vWh0mEhib6Pg+e+7PVBVIjXu8uhP8
         cw3dI2NGschCYtujx2E7GK3QitZSxrZZnJqkkobWU4QHVj4b9neR1oqWHg16/MjCI5GZ
         TPhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KF+AVWsF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f821a7si41744431cf.12.2025.05.08.03.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KF+AVWsF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCy8O-0003Ez-RM; Thu, 08 May 2025 06:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uCy8K-0003Ei-Sx
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uCy8J-0002QA-4U
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746698735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eTuRElDskZ0rm9oY9tFKzYq8CqWH0wRRX2ENNPuhWMc=;
 b=KF+AVWsF3MZaDqdvirU+XKmzXqXZkgcM8HhL34GkjotgsdhZTZFSCHEuJUB45v4+vO0bU7
 vp4n33E5D0XL8mbFhliSy85PdkXbEnunEm/j0t+Wrbj3eHVp1qDGVxGswd6keED0x8pF/Z
 Nl/kGSAK0hFTTcoT8nJ3X2Mez3/F9qc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-IQOJ-TxXMP6HR-lCF1NBOg-1; Thu,
 08 May 2025 06:05:32 -0400
X-MC-Unique: IQOJ-TxXMP6HR-lCF1NBOg-1
X-Mimecast-MFC-AGG-ID: IQOJ-TxXMP6HR-lCF1NBOg_1746698731
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 973E11800360; Thu,  8 May 2025 10:05:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 693DB19560A7; Thu,  8 May 2025 10:05:28 +0000 (UTC)
Date: Thu, 8 May 2025 11:05:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs
 on OpenBSD"
Message-ID: <aByB5B02zxvUZo7P@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-6-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250508093519.144004-6-thuth@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gNXtbAGwFEhDdltexjny1PRkE9URttgVKlIDhLVJZrk_1746698731
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mFwYghlylbWt

On Thu, May 08, 2025 at 11:35:19AM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.
> 
> OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBSD,
> see https://github.com/openbsd/src/commit/03eca72d1e030b7a542cd6aec1 for
> the fix there.

Is that fix also backported to OpenBS 7.6 ?

We support the 2 most recent releases of each platform, so for OpenBSD
thats currently 7.6 and 7.7.

If it wasn't backported to 7.6, we must wait until 7.8 before we can
rely on the fix being present.

> 
> Suggested-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 6c61e1dcaec..5f0e6a65cb0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -699,11 +699,7 @@ hardening_flags = [
>  #
>  # NB: Clang 17 is broken and SEGVs
>  # https://github.com/llvm/llvm-project/issues/75168
> -#
> -# NB2: This clashes with the "retguard" extension of OpenBSD's Clang
> -# https://gitlab.com/qemu-project/qemu/-/issues/2278
> -if host_os != 'openbsd' and \
> -   cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
> +if cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
>                 name: '-fzero-call-used-regs=used-gpr',
>                 args: ['-O2', '-fzero-call-used-regs=used-gpr'])
>      hardening_flags += '-fzero-call-used-regs=used-gpr'
> -- 
> 2.49.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

