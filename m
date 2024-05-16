Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1105939ejl;
        Wed, 15 May 2024 21:12:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVudxU3o5cmMJAvBuinPD8U6bsDpiB8bnFaQosic5tKJtti0ZNOLg2W3yJxpjTuhW37wZ3DEBSLdfSWw/ZUCZiYCv+yy1nt
X-Google-Smtp-Source: AGHT+IFyLhBbE8zKqWxYwY1M6M/lS1A/l+krvKI4lZhLgTCRJ80a5Ch57udB1MYte3NgutV/It4T
X-Received: by 2002:a05:6214:3a05:b0:6a0:de8b:4bfb with SMTP id 6a1803df08f44-6a1683769a3mr184495986d6.45.1715832720580;
        Wed, 15 May 2024 21:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715832720; cv=none;
        d=google.com; s=arc-20160816;
        b=GPC8ziuJZeGzxW2HB5uPonHBRwaSo8+bmNyoxo/bHR+z5w8O2LxR8J64Y53cvhkGPP
         kaUu9bm8CKjMglcjS1+Q5ZPKMuZf0piA+j89ZzFUaaa1tDNlq+gO91ZJ8crJl8sBiiRH
         InOIRRgAEMn3lBC7kL/FY4ZnF4KXBNvpmIn61oYFzJqGyDTM2I413v3sKR9b9mmJ9P9A
         eBg5pMzxs77Z4nAJKo0z4udNuACHTnL2hdMiTzl8rGVI7BrPtkr9nKwD41xF5jtUpbey
         KNIj+FBp/hbIYEjQ9QBm4G3zYXmse0PgZi1osddyTGsW+os1J8RpwQA48g951KHUzJq6
         AqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RgsmUie6oNRshpsUHGjExxGQpjucuEvOk67Y+fIg6zY=;
        fh=7Tejv7yUirOc/WKFyXDSVq3i9rhiGvHfnxAoi16yfxk=;
        b=mfRK84Fsi/XH4daExqmGrw4XpNoPZ3mUxTYSFD9CEoSRlwFBR7uauOP5z5urTilgr+
         LtESPuChS5PEn2z+y6GGjgxAd4qi9tlG9+lpuKdf65fuh7Rfp3yuJdvFUo/0VipN3cw2
         kvbmQaL6bNtId5mFtBnIDxQPZdJ42ZZTiFrSFb+b5Ms/Enxof3AuqrVuy2rXSmHCNUT9
         482awbbodi0j124JJ4ImtnQ5XWHZv1bS64Xkn4M3UnC6DUYudGWPIoZAvkSDp1cUQTrj
         H0hFrldr9Tlrra9cw40gBFFptqaDtr7gGxdDVlXOG6bbvlLz17PmpZVOtPUry/0NWEW+
         JkQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TdyQFTuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f29a71asi158640426d6.238.2024.05.15.21.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 21:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TdyQFTuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7SSx-0001aj-13; Thu, 16 May 2024 00:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7SSv-0001aG-4M
 for qemu-arm@nongnu.org; Thu, 16 May 2024 00:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7SSt-0003ZY-AQ
 for qemu-arm@nongnu.org; Thu, 16 May 2024 00:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715832694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgsmUie6oNRshpsUHGjExxGQpjucuEvOk67Y+fIg6zY=;
 b=TdyQFTuHB8IR5GCmJ60Fc8ZZJuJCQ7OChD3+o6sPNpJvv89yzXV706E2FgNPTSZFVIJHmX
 mTx78/XGrTwviEy/fLy5pOYFqMjkKWFGHNaMMXNGL3BWMTMsDyqZGAU2DmWnjV4kUkTKDA
 AZJ3VL4tMxyzqE+iQkoLIa4OPWb+dk4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-m5vQzpVuNbSU60qrMj5TkA-1; Thu, 16 May 2024 00:11:17 -0400
X-MC-Unique: m5vQzpVuNbSU60qrMj5TkA-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2b8a9cd19e9so615441a91.1
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 21:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715832676; x=1716437476;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RgsmUie6oNRshpsUHGjExxGQpjucuEvOk67Y+fIg6zY=;
 b=UyrbvXO+yRCirvkL700/TFftFgTaza1B1jIjFYdghRrpi8RExa5sggwqSPRcG8EhFn
 tOTlC3FiiXtCWbNoXv2zqrMqS6+Cy+eQg5xVOWbqmjlvwttQeg6XaH/dC70D40b0AWPs
 3XpcVwd6Iuv5tFAkBDr1yVuo4es+A7UPQMDxS7uvVuz1AO1VV9h0B1zIUz6uyY2lNfvO
 Op9NhPRcB5iCoFKRX3vVXfBExAw7HIQyt/fPk2+v4uuMW3Dv8d8a7KZqrlMOVFt57ILy
 8QDO5pf2k9cJS3YPuosKRMGcjlcOjT7sIVPpNduLMX741rXkP63fc0SoTsa0lvOI4cB5
 6apQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw3FkbrSwTj+Js7j+duW7/j/NssQ11niSI8mVrZgVN+EYIk40XyzVtkQQK6NJEHtHU7aeV+Bpr2Mxc4k27NWNiUneJ
X-Gm-Message-State: AOJu0YzxkPPgFzp4p88Yst8X3u7PiyQdHFYDNBb3pLu0NvSvRRbAzT/W
 27DLVedKQFgPQ/E0SrM1VHkzZECkj+EKx9qvVtLzyISL4CH2pOqWwE7O0/ac9yIwso8tPJhvvrV
 R/HdLnaGsxQjH2vLbbb49KcNtrncS+oTK37lRgIvNAxklD6kiyg==
X-Received: by 2002:a05:6a20:4306:b0:1ad:8f18:8621 with SMTP id
 adf61e73a8af0-1afde28cf65mr20831436637.6.1715832676453; 
 Wed, 15 May 2024 21:11:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:1ad:8f18:8621 with SMTP id
 adf61e73a8af0-1afde28cf65mr20831412637.6.1715832675762; 
 Wed, 15 May 2024 21:11:15 -0700 (PDT)
Received: from x1n ([67.214.252.166]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b9f5820ce9sm1624392a91.56.2024.05.15.21.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 21:11:15 -0700 (PDT)
Date: Wed, 15 May 2024 22:11:12 -0600
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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
Message-ID: <ZkWHYAM_iaPSamAw@x1n>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
 <ZkTc4Ott5M15k55R@redhat.com> <ZkTq3xBP-0UiLV2X@x1n>
 <ZkTtxLcgoZlzWH8A@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZkTtxLcgoZlzWH8A@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Zyzlbspnv5jV

On Wed, May 15, 2024 at 06:15:48PM +0100, Daniel P. Berrangé wrote:
> On Wed, May 15, 2024 at 11:03:27AM -0600, Peter Xu wrote:
> > On Wed, May 15, 2024 at 05:03:44PM +0100, Daniel P. Berrangé wrote:
> > > Above all, I'm failing to see why there's a compelling reason
> > > for virtio_gpu to diverge from our long standing practice of
> > > adding a named property flag "virtio_scanout_vmstate_fix"
> > > on the machine class, and then setting it in machine types
> > > which need it.
> > 
> > The reason to introduce that is definitely avoid introducing fields /
> > properties in similar cases in which case all the fields may represent the
> > same thing ("return true if MC is older than xxx version").  Especially
> > when such change is not bound to a new feature so in which case it won't
> > make sense to allow user to even control that propoerty, even if we
> > exported this "x-virtio-scanout-fix" property, but now we must export it
> > because compat fields require it.
> > 
> > However I think agree that having upstream specific MC versions in VMSD
> > checks is kind of unwanted.  I think the major problem is we don't have
> > that extra machine type abstract where we can have simply a number showing
> > the release of QEMU, then we can map that number to whatever
> > upstream/downstream machine types.  E.g.:
> > 
> >   Release No.         Upstream version       Downstream version
> >   50                  9.0                    Y.0
> >   51                  9.1
> >   52                  9.2                    Y.1
> >   ...
> 
> Downstream versions do not map cleanly to individual upstream versions
> across the whole code base. If we have two distinct features in upstream
> version X, each of them may map to a different downstream release. 
> 
> This can happen when downstream skips one or more upstream releases.
> One feature from the skipped release might be backported to an earlier
> downstream release, while other feature might not arrive downstream
> until they later rebase. Version based checks are an inherantly
> undesirable idea for a situation where there is any backporting taking
> place, whether its machine type versions or something else. Named feature
> / flag based checks are always the way to go.

I thought this should work better with things like this where we only want
to fix a break in ABI, and none of downstream should special case things
like such fix.. but I agree even with that in mind such case could be so
rare to bother with above scheme.  I could have raised a bad idea I
suppose. :-( Let's stick with the simple until someone has better idea.

Thanks,

-- 
Peter Xu

