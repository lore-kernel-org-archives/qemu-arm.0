Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3184259njc;
        Wed, 16 Apr 2025 01:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7lDk5xyFLC5CfKpZlmCmr2FgiJAAzym6YXw/+rCKENxHF6zWAaYRqEchJO7sufHg2m1A1PsM3Xmzl+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFd+6uK5BJpFmAadaZaG8lwS4+r9J40J+cq6JQbQCK79JyFtFaeUvhU0koB2P3Zz1mq/WRu
X-Received: by 2002:a05:690c:6f08:b0:6fb:9280:5bf4 with SMTP id 00721157ae682-706b3363991mr13358907b3.30.1744792160061;
        Wed, 16 Apr 2025 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744792160; cv=none;
        d=google.com; s=arc-20240605;
        b=C6KNYcbT45Ts9W7raUM5rjbbEccYz4wfWc2+xtuF2BYiBtFJEuyaTipDm+cWIOvsRz
         uAqljsu62zklYEM+4mCvFX0/AFw1s4srZHPmt3kmeEAy0d3j28L+OxyUMs9KeqY3G1rV
         4oIelQ4Hi/OTgW56ai656b75vggrtG/y5IsUuFX1V189Aj9U+Wr6vGI6FqUnZopJh72p
         M84CUa63/FqsEcMXvvq1V8aCyhKat5yQvotbFn+XxSsCJQkwi2dZTVP2cKhO0u3ToDUj
         zz9fhva5u9PNX94foFtjG+MO4tScBqbQWL7jiDT7zse7sqQqS89WS+kV+FcW/mLfKljb
         YFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=KpK5a5N522QrVFFwZVgIKrckLxvNrQwiWNFASbDGrUE=;
        fh=oOTJNc2Ke305c1XgESVqCB6I9OL9mWksUmzrmt7korA=;
        b=SjHEFQjwD5c+DCwLSLR22rY3zNPfbu9Eddw6DRVRqCZr5+1ILp8mNh6lBDC9e2qLn6
         nFqRUdbG9G0IMBMXKwNW3EP3WzF1ctjJ3fqJCwzbaaUMRcmC9ukS9DL/quRQ5iUPepFC
         hSyAapsOXAVErrkgbOg3DtuYP8fp2Om5KYDOfg3jvSoOmCm7648e5hvNITlHY6Zc5HiV
         Ie334vB3/GRo/bHPhoTMlMyrG7BUHRXnwB8Nkx10Zxp70vu2VZOIkEPg4A5w+92ORy3b
         daTBiSqD4GNnHMQH6oiolqQwDXV9n3d6EWC1yq/mWIhNH7w+6hFodaM8zojOyquw3KiE
         qdxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WZkF4/jx";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-7053e381d78si206888787b3.431.2025.04.16.01.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WZkF4/jx";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744792159;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=KpK5a5N522QrVFFwZVgIKrckLxvNrQwiWNFASbDGrUE=;
	b=WZkF4/jxQbUeY9H/sXLLu8oYuTBrAFHde27SmKAQuITTxoMVxmzdQbmjgSlB1fqI/rMdtg
	RpPo3hM5sBFph0yuvDylNIzGkaDKCvwknYCMEdauSFLyrIb3Y3p/zXcjs/5m/tIl2nRRBI
	87lVa1Ctqh2fvoOVTK8xnO1GM1slBf4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-jvrBfuqLOAW5oyi64e-xsA-1; Wed,
 16 Apr 2025 04:28:55 -0400
X-MC-Unique: jvrBfuqLOAW5oyi64e-xsA-1
X-Mimecast-MFC-AGG-ID: jvrBfuqLOAW5oyi64e-xsA_1744792133
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0EFA1955D98;
	Wed, 16 Apr 2025 08:28:50 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 295E3180047F;
	Wed, 16 Apr 2025 08:28:39 +0000 (UTC)
Date: Wed, 16 Apr 2025 09:28:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Cc: qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
Message-ID: <Z_9qIQhjsI5zOwXA@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: Bfdn6eD74vYV

On Wed, Apr 16, 2025 at 05:14:06PM +0900, Kohei Tokunaga wrote:
> On emscripten, function pointer casts can cause function call failure.
> This commit fixes the function definition to match to the type of the
> function call using g_list_sort_with_data.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>  hw/core/loader.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 2e35f0aa90..93a8b45d28 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1410,7 +1410,7 @@ typedef struct RomSec {
>   * work, but this way saves a little work later by avoiding
>   * dealing with "gaps" of 0 length.
>   */
> -static gint sort_secs(gconstpointer a, gconstpointer b)
> +static gint sort_secs(gconstpointer a, gconstpointer b, gpointer d)
>  {
>      RomSec *ra = (RomSec *) a;
>      RomSec *rb = (RomSec *) b;
> @@ -1463,7 +1463,7 @@ RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
>      /* sentinel */
>      secs = add_romsec_to_list(secs, base + size, 1);
>  
> -    secs = g_list_sort(secs, sort_secs);
> +    secs = g_list_sort_with_data(secs, sort_secs, NULL);

I don't see what the problem is with the original code.

The commit message says we have a bad function cast, but the original
method decl is

  GList *g_list_sort(GList*list, GCompareFunc compare_func);

where the callback is

   typedef gint (*GCompareFunc)(gconstpointer a, gconstpointer b);

Our code complies with that GCompareFunc signature.

For comparison the new code uses:

  GList *g_list_sort_with_data(GList *list, GCompareDataFunc  compare_func, gpointer user_data);

where the callback is

  typedef gint (*GCompareDataFunc)(gconstpointer a, gconstpointer b, gpointer user_data);

which the new code complies with, but it is undesirable since we
have no use for the data parameter.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
