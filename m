Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2326748wrw;
        Wed, 7 Nov 2018 08:28:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5ec3d7WJpCZGFIhmgvoiGUS0t5ENzfToI6kI4u4UMzStAj80nJIY/YlRE1ryUv4+FEVDNcm
X-Received: by 2002:ac8:30ac:: with SMTP id v41mr872601qta.51.1541608137252;
        Wed, 07 Nov 2018 08:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541608137; cv=none;
        d=google.com; s=arc-20160816;
        b=yfW+My2vHa4nlUTkShjETQ6ThXShE40rWXzSNg3cOgtUTzj+P+JfoqbnoKg7a2rDp1
         JIr+4yc/kMkRIoYNEQgzJY2g7gOgW0m+stmJd9wjjJ893SIHK/AyESx02zbINLeLkyL+
         AdR2EO/c1HYX7qZa87+mbDao+jQEA3osmLIiaHMeem6z+KLCo+vONYmQX6bIs9Gi8j68
         5x9W+Zyk1QPMOZfiUyro+RCzBukZCl1ue4aFRK/YbhKH1rBVNzM7VhWiQGfwvh4UqyX8
         XpmtLY2iDw7hnEyrYnrlfuN2SzUCH7QPE+LSph4jhdv9muHzF7nlcF06/RJv/EGtXv86
         /Jjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=H+3M+WdJb5PZepui/f+insW5faHVN9uIpHDEkvJ7Z/w=;
        b=Gq4rx+Ahf4JwgFQWz1/bgxcfrQc1X7jfCsd/OWtAaBYEK286oLXvqrxpZQnXNzfStK
         qs1QTnfAFkRi218yOlUta9Go9Q0q0EP4dfLKFFuNEh6CyKKdHiVnciafbe3Lg5gOppLW
         c839Ms4B4yqub1bTfPUE+MrPRh6u1d4DYiGPfF/gGmdI+moj6eRmkLJ0CecSXPcIy3+f
         wrsefW3b+CP/Xq8RUTX5aw8kTuAKy2INJT8p5Fac+ToMNSvGtzWVDkV9QXGP50U7UrDz
         d9VOC+RFib1wR8OQ89knZ9KKVKE9Au77Rjeq2f6LDEkvisIV0UkXUrSvQ18Hg5DEqItI
         OPew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si780976qtd.327.2018.11.07.08.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 08:28:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKQhM-00055c-O5
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 11:28:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1gKQgS-000528-12
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 11:28:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1gKQgN-00060D-RX
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 11:27:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1gKQgF-0005rd-Pm; Wed, 07 Nov 2018 11:27:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB4DB3082A30;
	Wed,  7 Nov 2018 16:27:46 +0000 (UTC)
Received: from w520.home (ovpn-116-133.phx2.redhat.com [10.3.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5679026325;
	Wed,  7 Nov 2018 16:27:22 +0000 (UTC)
Date: Wed, 7 Nov 2018 09:27:21 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181107092721.6c01f09e@w520.home>
In-Reply-To: <20181106184212.29377-1-eric.auger@redhat.com>
References: <20181106184212.29377-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 07 Nov 2018 16:27:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 for-3.1] hw/arm/sysbus-fdt: Only call
 match_fn callback if the type matches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, geert+renesas@glider.be,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kraxel@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: om8UnFvWcAbz

On Tue,  6 Nov 2018 19:42:12 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Commit af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with DT
> compatible value) introduced a match_fn callback which gets called
> for each registered combo to check whether a sysbus device can be
> dynamically instantiated. However the callback gets called even if
> the device type does not match the binding combo typename field.
> This causes an assert when passing "-device ramfb" to the qemu
> command line as vfio_platform_match() gets called on a non
> vfio-platform device.
> 
> To fix this regression, let's change the add_fdt_node() logic so
> that we first check the type and if the match_fn callback is defined,
> then we also call it.
> 
> Binding combos only requesting a type check do not define the
> match_fn callback.
> 
> Fixes: af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with
> DT compatible value)
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Thomas Huth <thuth@redhat.com>

The commit this fixes went through the vfio tree, but since the fix
itself only lives in arm code, I'll leave it to arm maintainers to
shepherd this fix and offer:

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

> ---
> 
> v1 -> v2:
> - use "if (!iter->match_fn || iter->match_fn(sbdev, iter)) {"
>   as suggested by Peter to avoid code duplication
> - mention the ramfb regression fixed by this patch in the
>   commit message.
> ---
>  hw/arm/sysbus-fdt.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 0e24c803a1..ad698d4832 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -449,7 +449,7 @@ static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
>      return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
>  }
>  
> -#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), type_match}
> +#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), NULL}
>  
>  /* list of supported dynamic sysbus bindings */
>  static const BindingEntry bindings[] = {
> @@ -481,10 +481,12 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
>      for (i = 0; i < ARRAY_SIZE(bindings); i++) {
>          const BindingEntry *iter = &bindings[i];
>  
> -        if (iter->match_fn(sbdev, iter)) {
> -            ret = iter->add_fn(sbdev, opaque);
> -            assert(!ret);
> -            return;
> +        if (type_match(sbdev, iter)) {
> +            if (!iter->match_fn || iter->match_fn(sbdev, iter)) {
> +                ret = iter->add_fn(sbdev, opaque);
> +                assert(!ret);
> +                return;
> +            }
>          }
>      }
>      error_report("Device %s can not be dynamically instantiated",

