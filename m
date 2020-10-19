Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3684914lfa;
        Mon, 19 Oct 2020 01:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6ZZk7csbBOyntXmM35qYIOsGDAhm6sYQUQhlVUwSZOCnJOxfqGN3o+8FhWfjCRCrssUhX
X-Received: by 2002:a25:2a4e:: with SMTP id q75mr18847274ybq.427.1603097723244;
        Mon, 19 Oct 2020 01:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603097723; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2dUe5Dfaxcz19DEMd9PloNPGctcfqE5iJREqAo5XRI55OH9nCC97JIk9Nv+84HZbj
         KE5+Vdnys9bA0cIinH/A4A31+S1cKGNEXkIBKW6jhuu4+VXJD3sQM2A8q0+7+l4kyYQA
         gG0xamI3Jwa1KQEDB6r12xkvp+GrjAEFrAl0aGFGHYMuLRJ/MrIdCx8BAs2irVLRzF3r
         pNtJ0uApWJ5XK4a7Kw0Lay0KuvTxX59Qkahgm9oLs+LU2kFvLd66xaDeChO+IPYt2utl
         nRKvdbpfp3HAFTAF+P2edZIyl4SgIq2wtfLqbJ4HkMK1PRUMlEhdNnmjnw4Bw98iy/Oz
         pGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Q26CNdJXI7dTrNvrc4aWTxsNvYzFepC4s1JUWSi6AcM=;
        b=egkRmxa1rLiBINv1De8yKtr/TigYYWB1BUO3dZmH6mfEgxdsq9EHak78MUE7kR8ubr
         e/j9Bd+gn6Vz9JEsGtLcmimbVfYCqHDejLsRHk8hIYxwrA9a0dP6OvPBNr8XHHJaZr5c
         Apk38sUjMSBX4niBYpDhf2S1KKrTF29Wh6EFIODg6aTvfM/TGjbGEgm9qH3SYeApIo9V
         1wAL7/RKgTP3Sc4Q1tDB9Agq89cAocihCL8xZj/daI2+og1br+9fAAkUV1uXcPpnFtX3
         Y7zjWNXFBfw0hIrpY3VmqlGhdNTA4LY+SsR2hJoW/0A9UB3YauUH9bEdKLlaKVplPEDI
         Vzhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SFv++abe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si10050272ybc.42.2020.10.19.01.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 01:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SFv++abe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUQws-0002VW-HY
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 04:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kUQwP-0002Tt-O7
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 04:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kUQwK-00046M-2l
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 04:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603097685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q26CNdJXI7dTrNvrc4aWTxsNvYzFepC4s1JUWSi6AcM=;
 b=SFv++abeNtNAfua1n4TBLMTEVh8XLDvRprJd7qFZC/Z7M6uvoNKKdHPA4xhbqyLOsdR9RE
 edVHnr1MceLdkE2ZUg1Cu50QCUDYQaPfjIbrcHkVmOkP09gW2ZncBQLAFsjjnfpeh7JUof
 h2nCZip/6Gh98NyvypO8Xrbn+WQQKGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-jdGd289LO7-Rq2stRq6uVw-1; Mon, 19 Oct 2020 04:54:43 -0400
X-MC-Unique: jdGd289LO7-Rq2stRq6uVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7454C18BE187;
 Mon, 19 Oct 2020 08:54:42 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C1CB5D9D2;
 Mon, 19 Oct 2020 08:54:34 +0000 (UTC)
Date: Mon, 19 Oct 2020 10:54:31 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] docs/system: Deprecate raspi2/raspi3 machine aliases
Message-ID: <20201019085431.GF3081357@angien.pipo.sk>
References: <20201019082121.1544550-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20201019082121.1544550-1-f4bug@amsat.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: libvir-list@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0hVze5SWOtqQ

On Mon, Oct 19, 2020 at 10:21:21 +0200, Philippe Mathieu-Daudé wrote:
> Since commit aa35ec2213b ("hw/arm/raspi: Use more
> specific machine names") the raspi2/raspi3 machines
> have been renamed as raspi2b/raspi3b.
> 
> As more Raspberry Pi 2/3 models are emulated, in order
> to avoid confusion deprecate the raspi2/raspi3 machine
> aliases.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 905628f3a0c..f0c7aaeb2ff 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -355,6 +355,11 @@ This machine has been renamed ``fuloong2e``.
>  These machine types are very old and likely can not be used for live migration
>  from old QEMU versions anymore. A newer machine type should be used instead.
>  
> +Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
> +'''''''''''''''''''''''''''''''''''''
> +
> +These machines have been respectively renamed ``raspi2b`` and ``raspi3b``.
> +

libvirt doesn't do any interpretation for these machine types, so we
don't need to add any compatibility. Obviously users of these machine
types might end up with broken configs if they were using them, but
that's qemu's decision.

On behalf of libvirt:

ACKed-by: Peter Krempa <pkrempa@redhat.com>

