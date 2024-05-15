Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp807260ejl;
        Wed, 15 May 2024 10:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWK6gdxm6E/fjCB0vDnHbqeANNb219FCT/clfS6F8+jf8fpc0fvMLXmEuTI8SHyGsrP6ZJqprUFBejksbsORKPK5hNxbU0e
X-Google-Smtp-Source: AGHT+IEglQ2q5npqnHb59XiMIVYU9nnkU9Df43dQpz6CpGDXGO8gsibmD1DrZbC9Y3j2nXVaCnYf
X-Received: by 2002:ac8:5790:0:b0:43d:f527:a755 with SMTP id d75a77b69052e-43dfcca5260mr264736571cf.13.1715793392477;
        Wed, 15 May 2024 10:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715793392; cv=none;
        d=google.com; s=arc-20160816;
        b=hgGhNDdzdln0ua9uUElRHyzLIG73AvGCAkBVQDyjOPNAPIzbeNVV6wGqvP8bVtx74k
         KuyfiGU+Q+RqteK+BIicBikp14S2XtYIfdptRJJgAZ+zuIRkdjKtvO+lcfIMz6hoVgb+
         UZ38Vm2+P0u2m+MJFCEP7swzxIBF3Zo6yKBt2TcSxMfAwhKP7kTijlWgO1C0zEXhw/CH
         neVrwUtwI2+x7IDVvcH80Lz0je5HBUkDcrkUwUJQXf8PM7XPjW9E794JvWSxth0nnMq7
         4q9AIQK7EMZwVOTJ1JIKtRHMEboVgh6AKKIZiEFsXV7lUf74x3/6QPlUQo3W64C04ExZ
         JIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ylikw8ccb4mPv+LeyJnZKvuPdfRqWuZV3CXPrn9Nvx0=;
        fh=GuZCKpfr+VlDDGZOUgDiBHAPPxrV+uY3bO8yTNq0FbE=;
        b=WaHiGhb1NXvpVr74Aq6AM9K1JQwE6sPPz5I9UDeHTmAvF1NA5yQ9PxaG4bC9QOGNkS
         riyJM5m87kkAvwaDBcT6Fq6Qd3LjIeGF97lzeZ0W4P6HEIBzVhZU2CojWVQGrrFLUUhS
         w8cxENVjMVgSeNedraW+TP7vnh840rrvP7FqVWX/eTe/diM9NYdAYTeIcUkPaRC8m59D
         vsvL0SbJONOL2SWC/w18OIZH1ACuFpvGNI9p1JNPQy9tz29JsaWUEZA55z+MaOZVwhV8
         8hZZiqMDbMPaSgrk3DkqNxx2RYQahHVaYo4XoWZFAMz+gFLkHxG8C1hUyxS7eFIGRRtF
         CDrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBuM7VC9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e0aa65301si97959381cf.171.2024.05.15.10.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 10:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBuM7VC9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s7IEj-0003Dp-UK; Wed, 15 May 2024 13:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s7IEa-00033s-FE
 for qemu-devel@nongnu.org; Wed, 15 May 2024 13:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s7IEY-0004Yi-KO
 for qemu-devel@nongnu.org; Wed, 15 May 2024 13:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715793365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylikw8ccb4mPv+LeyJnZKvuPdfRqWuZV3CXPrn9Nvx0=;
 b=FBuM7VC9cS+HZ/flSeLj8YjzrH6v6jL6oDkrdqtaNmiG6awAqu1twTSeIWZswh+9BdeMkA
 Wy6qPzpmeOlIwfb1bQ4pi1zm165qu44wIoGtgL6Vqq/KQRgiLZL2n8Gud3i9eyz0gUi75d
 58cpddOgYB01iEzVd1QAPaaOXso3XNA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-K__IdceSMHyvBdS5wPCoRA-1; Wed,
 15 May 2024 13:15:54 -0400
X-MC-Unique: K__IdceSMHyvBdS5wPCoRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B35C929ABA13;
 Wed, 15 May 2024 17:15:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F01103A3AF;
 Wed, 15 May 2024 17:15:50 +0000 (UTC)
Date: Wed, 15 May 2024 18:15:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 5/5] virtio-gpu: fix v2 migration
Message-ID: <ZkTtxLcgoZlzWH8A@redhat.com>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
 <ZkTc4Ott5M15k55R@redhat.com> <ZkTq3xBP-0UiLV2X@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkTq3xBP-0UiLV2X@x1n>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: rxiiXxFzm+2W

On Wed, May 15, 2024 at 11:03:27AM -0600, Peter Xu wrote:
> On Wed, May 15, 2024 at 05:03:44PM +0100, Daniel P. Berrangé wrote:
> > Above all, I'm failing to see why there's a compelling reason
> > for virtio_gpu to diverge from our long standing practice of
> > adding a named property flag "virtio_scanout_vmstate_fix"
> > on the machine class, and then setting it in machine types
> > which need it.
> 
> The reason to introduce that is definitely avoid introducing fields /
> properties in similar cases in which case all the fields may represent the
> same thing ("return true if MC is older than xxx version").  Especially
> when such change is not bound to a new feature so in which case it won't
> make sense to allow user to even control that propoerty, even if we
> exported this "x-virtio-scanout-fix" property, but now we must export it
> because compat fields require it.
> 
> However I think agree that having upstream specific MC versions in VMSD
> checks is kind of unwanted.  I think the major problem is we don't have
> that extra machine type abstract where we can have simply a number showing
> the release of QEMU, then we can map that number to whatever
> upstream/downstream machine types.  E.g.:
> 
>   Release No.         Upstream version       Downstream version
>   50                  9.0                    Y.0
>   51                  9.1
>   52                  9.2                    Y.1
>   ...

Downstream versions do not map cleanly to individual upstream versions
across the whole code base. If we have two distinct features in upstream
version X, each of them may map to a different downstream release. 

This can happen when downstream skips one or more upstream releases.
One feature from the skipped release might be backported to an earlier
downstream release, while other feature might not arrive downstream
until they later rebase. Version based checks are an inherantly
undesirable idea for a situation where there is any backporting taking
place, whether its machine type versions or something else. Named feature
/ flag based checks are always the way to go.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

