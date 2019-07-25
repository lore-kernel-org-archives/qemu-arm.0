Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10883132wrv;
        Thu, 25 Jul 2019 10:27:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyV+dmkmDQJCD24WtoKifOwzQyPzO8QbXqMt0PXf8FP7320m+PF863RlHa0MClyuzfx48u
X-Received: by 2002:a67:2d0f:: with SMTP id t15mr54741452vst.26.1564075646789;
        Thu, 25 Jul 2019 10:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564075646; cv=none;
        d=google.com; s=arc-20160816;
        b=i3J6gmAZNNgLU4KBf7/FIEe/wOLOAgsTZ93G0Jn2tDfmscxPAxv7eijqVA3M3BCfmi
         I71eXPDaxGOwDaSYS7qX3/yJcVUsJ16n1qO61tn3VD+hHhDsm5X/IG4S4bk2Euf/YBHu
         SYAbZO20jvlb7fE9FM4n/QNphNz+EkQ3QopUPpz6F3gXmKZw8X8uSHWlMm4BdQjsFKrd
         AZPhpW1+D6bP87EAqUbbtTgfyx38ifqj/LcmYhZsLxd1qAmkCgI/Jtop3IWSOZMogGT+
         LFuUBr1aqUY7wTh7KJaSKCGCusuzMgKYNv5bM1T9wRq4in8KtMA+OFeafdBLRXOVfuXQ
         2J7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Oi80uOf72oCQOv3SD9fj8E0PXohrSg0sgD77JDxr2Fc=;
        b=MNBC5NIxaCkAStJ1gRvaQ1zE9ubjGgXZLGaBh84ur84UD0S59AYayLtJj99dhoylFG
         CEbmuABrsJ9XL0y4c/3QUtlEYuGpAlO1YhHLwRKBvopcntl7ApgDDrpB35EpEVaqQY0e
         XAH5xCE16XM9BDaxzNoH1R7EiuFPDqs19C2cDMjZwWv95TGDLxeOR0X6H9XoKT6Iilv1
         A7tcqaof5GppFwRAc2ux1vjOFtU2yN/isYKU8BDEh7f46hXdglaq49FcTkUjsP7nSDi2
         Po4x4irUEF4C+RddSNE6rmiaRgCFWmCDN8zWPEzY1f1BEb/DerxePBm4BHDb6Nf+BlVb
         L87A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p185si19407984vsd.180.2019.07.25.10.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 10:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqhWY-0001Yg-C1
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 13:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57289)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqhWU-0001YM-Ri
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:27:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqhWS-0001ct-LD
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:27:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57060)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqhWO-0001bs-VF; Thu, 25 Jul 2019 13:27:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D6EE037F41;
 Thu, 25 Jul 2019 17:27:15 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A82425DA9A;
 Thu, 25 Jul 2019 17:27:14 +0000 (UTC)
Date: Thu, 25 Jul 2019 18:27:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190725172712.GM2656@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725163710.11703-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 25 Jul 2019 17:27:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HRqdT5d3RceU

* Peter Maydell (peter.maydell@linaro.org) wrote:
> The VMSTATE_STRUCT_VARRAY_UINT32 macro is intended to handle
> migrating a field which is an array of structs, but where instead of
> migrating the entire array we only migrate a variable number of
> elements of it.
> 
> The VMSTATE_STRUCT_VARRAY_POINTER_UINT32 macro is intended to handle
> migrating a field which is of pointer type, and points to a
> dynamically allocated array of structs of variable size.
> 
> We weren't actually checking that the field passed to
> VMSTATE_STRUCT_VARRAY_UINT32 really is an array, with the result that
> accidentally using it where the _POINTER_ macro was intended would
> compile but silently corrupt memory on migration.
> 
> Add type-checking that enforces that the field passed in is
> really of the right array type. This applies to all the VMSTATE
> macros which use flags including VMS_VARRAY_* but not VMS_POINTER.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> ---
>  include/migration/vmstate.h | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index ca68584eba4..2df333c3612 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -227,8 +227,19 @@ extern const VMStateInfo vmstate_info_bitmap;
>  extern const VMStateInfo vmstate_info_qtailq;
>  
>  #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
> +/* Check that t2 is an array of t1 of size n */
>  #define type_check_array(t1,t2,n) ((t1(*)[n])0 - (t2*)0)

I'd have to admit I don't understand why that does what you say;
I'd expected something to index a t2 pointer with [n].

However, for the rest of it, from migration I'm happy:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

given it's just fixing an ARM bug, and given it'll blow up straight away
I think it's OK for 4.1; the only risk is if we find a compiler we don't
like.


>  #define type_check_pointer(t1,t2) ((t1**)0 - (t2*)0)
> +/*
> + * type of element 0 of the specified (array) field of the type.
> + * Note that if the field is a pointer then this will return the
> + * pointed-to type rather than complaining.
> + */
> +#define typeof_elt_of_field(type, field) typeof(((type *)0)->field[0])
> +/* Check that field f in struct type t2 is an array of t1, of any size */
> +#define type_check_varray(t1, t2, f)                                 \
> +    (type_check(t1, typeof_elt_of_field(t2, f))                      \
> +     + QEMU_BUILD_BUG_ON_ZERO(!QEMU_IS_ARRAY(((t2 *)0)->f)))
>  
>  #define vmstate_offset_value(_state, _field, _type)                  \
>      (offsetof(_state, _field) +                                      \
> @@ -253,6 +264,10 @@ extern const VMStateInfo vmstate_info_qtailq;
>      vmstate_offset_array(_state, _field, uint8_t,                    \
>                           sizeof(typeof_field(_state, _field)))
>  
> +#define vmstate_offset_varray(_state, _field, _type)                 \
> +    (offsetof(_state, _field) +                                      \
> +     type_check_varray(_type, _state, _field))
> +
>  /* In the macros below, if there is a _version, that means the macro's
>   * field will be processed only if the version being received is >=
>   * the _version specified.  In general, if you add a new field, you
> @@ -347,7 +362,7 @@ extern const VMStateInfo vmstate_info_qtailq;
>      .info       = &(_info),                                          \
>      .size       = sizeof(_type),                                     \
>      .flags      = VMS_VARRAY_UINT32|VMS_MULTIPLY_ELEMENTS,           \
> -    .offset     = offsetof(_state, _field),                          \
> +    .offset     = vmstate_offset_varray(_state, _field, _type),      \
>  }
>  
>  #define VMSTATE_ARRAY_TEST(_field, _state, _num, _test, _info, _type) {\
> @@ -376,7 +391,7 @@ extern const VMStateInfo vmstate_info_qtailq;
>      .info       = &(_info),                                          \
>      .size       = sizeof(_type),                                     \
>      .flags      = VMS_VARRAY_INT32,                                  \
> -    .offset     = offsetof(_state, _field),                          \
> +    .offset     = vmstate_offset_varray(_state, _field, _type),      \
>  }
>  
>  #define VMSTATE_VARRAY_INT32(_field, _state, _field_num, _version, _info, _type) {\
> @@ -416,7 +431,7 @@ extern const VMStateInfo vmstate_info_qtailq;
>      .info       = &(_info),                                          \
>      .size       = sizeof(_type),                                     \
>      .flags      = VMS_VARRAY_UINT16,                                 \
> -    .offset     = offsetof(_state, _field),                          \
> +    .offset     = vmstate_offset_varray(_state, _field, _type),      \
>  }
>  
>  #define VMSTATE_VSTRUCT_TEST(_field, _state, _test, _version, _vmsd, _type, _struct_version) { \
> @@ -520,7 +535,7 @@ extern const VMStateInfo vmstate_info_qtailq;
>      .vmsd       = &(_vmsd),                                          \
>      .size       = sizeof(_type),                                     \
>      .flags      = VMS_STRUCT|VMS_VARRAY_UINT8,                       \
> -    .offset     = offsetof(_state, _field),                          \
> +    .offset     = vmstate_offset_varray(_state, _field, _type),      \
>  }
>  
>  /* a variable length array (i.e. _type *_field) but we know the
> @@ -573,7 +588,7 @@ extern const VMStateInfo vmstate_info_qtailq;
>      .vmsd       = &(_vmsd),                                          \
>      .size       = sizeof(_type),                                     \
>      .flags      = VMS_STRUCT|VMS_VARRAY_INT32,                       \
> -    .offset     = offsetof(_state, _field),                          \
> +    .offset     = vmstate_offset_varray(_state, _field, _type),      \
>  }
>  
>  #define VMSTATE_STRUCT_VARRAY_UINT32(_field, _state, _field_num, _version, _vmsd, _type) { \
> @@ -583,7 +598,7 @@ extern const VMStateInfo vmstate_info_qtailq;
>      .vmsd       = &(_vmsd),                                          \
>      .size       = sizeof(_type),                                     \
>      .flags      = VMS_STRUCT|VMS_VARRAY_UINT32,                      \
> -    .offset     = offsetof(_state, _field),                          \
> +    .offset     = vmstate_offset_varray(_state, _field, _type),      \
>  }
>  
>  #define VMSTATE_STRUCT_VARRAY_ALLOC(_field, _state, _field_num, _version, _vmsd, _type) {\
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
