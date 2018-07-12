Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1605658wrq;
        Thu, 12 Jul 2018 10:09:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfpVEq5mCFWpjPBm1ekphByQqr4v8dNV6RNIKANAVm9JPiAmA9YuYGk1Qp1GNrjhyqWxbXN
X-Received: by 2002:a37:404c:: with SMTP id n73-v6mr2512692qka.250.1531415394826;
        Thu, 12 Jul 2018 10:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531415394; cv=none;
        d=google.com; s=arc-20160816;
        b=MQ1Osct4zLI+0M+Wl5ijaeLezhhAFSxUFX40AukdW3UNkam6icNfwXtVAAPDAyJuhx
         IEAxuHvDiZrNws4Jz5YygDVoosIbd9RbICZLLgC0CkWbBXT9yeqc8SpIBqK6sIgXewdQ
         qX/yjSGAYa1bGWgn9y0XsfVssT+Nt4RVXX7Xp3/XpEMfIrdXMn4F9B0ox6seM2tJGZtB
         5o5NkgyhEZ/Hwwb38hT71pTHf/NYAwSYIGn9rKOUn+rdWl7VmAMxEWfV4Nueaqljq/YF
         nqz5zIS5jmdvFxXMXAiuB92wCtlJ2uqGyEq60Qvb0S5frQPMBpYLkWoM90mfXZkvf/nJ
         vbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e7HjXeGDKTbKI+oVG9exW5lf3v3LTyMqd5uAr3R7MK8=;
        b=dqFRGbsVoiyL4FHZb4z37Ma2Z0Xmdub6q4LgpTKOil9fM4O6SmksDPkrc0wQNlCyI8
         KxXBW8m4hdv37UrOuVCbT8jbTSTXoAhsUtVy+nH+Hveo/9aMh1uWhrcfsNRSbRmycpAJ
         0DG6aSzL5PlXZpdF9J5ExrO96KZmcV97aI3gPDQZukHM7Je5G/nNuSh/u6pclxwo5TKB
         9KzxDwr4j0wCzBq5Z1sDYJV0PaQTzrCU1TU+P4XyEfMPk01mzJGI/r3s/oNGkdTt1la1
         Cauc0W0MW5IV4t7dwjeQwCOWSm1+vJCIt1QiK8kYWUoRT0yf6BmrCyiqoAdUCn4UiaXW
         JCng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afw0I8d8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34-v6si7159813qtz.273.2018.07.12.10.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 10:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afw0I8d8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdf6I-0007b8-7l
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 13:09:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdf67-0007XG-GQ
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdf66-0006Vs-Jb
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:09:43 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdf66-0006Uw-DP
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:09:42 -0400
Received: by mail-oi0-x244.google.com with SMTP id d189-v6so57117379oib.6
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e7HjXeGDKTbKI+oVG9exW5lf3v3LTyMqd5uAr3R7MK8=;
	b=afw0I8d8NKA19Ju1A/ixuXK1sOxvx47cjf0BDgN/8fi3h9SBdTNFdvRMgpcNXSQ75B
	KmRXLpRr7/DhGzFGZwh3Hmhu94jP1YdL33ZfX/xFNgxGAsA7Orx1GPtHK1822FC40rk+
	5P8p21QKaaFhNeVMUBSxKARbHCL11a6Xu4XlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e7HjXeGDKTbKI+oVG9exW5lf3v3LTyMqd5uAr3R7MK8=;
	b=cT57+PH6XWRia3Ct1EiND5Odn41gJfxZsnelAV7HkPc7yQ2xqnzLbJxyoVMZ2tMYeZ
	kKsANrtYsiXu866tyCZHqyeof4vglYcFcJATb8Z0VaEwcPk0JnBhJkmEc0FZOkjBJzxA
	Yf7z9eMMU+OoSJ4wAeOk2inY9nuGSZepTfu4dAvCAawnNCF7EGiz8LgQju99gaSPlGYE
	LNOHlsI5xi/z2P+1hC1MKo6ZdGe/w0nTeb0oin0rQgfEdvIWTyjL4309Zir3BDNZfhX3
	tvnLXm0oCe8gfOaSqPdR2ho9ITgl8DH57UiOVk+l+kZwpnz0MEZv4+Z2ae0ynJThYYaY
	GERw==
X-Gm-Message-State: AOUpUlENrWMpY7uVi2+sjDvGeunJ7tq5o+1GcSTPGygf7y/QZk58ndzR
	RUGSvRVrPw4b3UBcCdp4HWTlJ20wWsi+FwCd+qmN3Q==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr3028133oib.337.1531415381781; 
	Thu, 12 Jul 2018 10:09:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 10:09:21
	-0700 (PDT)
In-Reply-To: <224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
	<20180712165224.GD31657@localhost.localdomain>
	<224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 18:09:21 +0100
Message-ID: <CAFEAcA8-1TiRD2S4hJW1tXfi2ivV-ONg=wEFiX+uGfweD6mY6g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 1/5] qom/object: Add a new function
 object_initialize_as_child()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kAoDV5UG7wOS

On 12 July 2018 at 17:55, Thomas Huth <thuth@redhat.com> wrote:
> On 12.07.2018 18:52, Eduardo Habkost wrote:
>> On Thu, Jul 12, 2018 at 05:30:59PM +0200, Thomas Huth wrote:
>>> @@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
>>>  void object_initialize(void *obj, size_t size, const char *typename);
>>>
>>>  /**
>>> + * object_initialize_as_child:
>>> + * @parentobj: The parent object to add a property to
>>> + * @propname: The name of the property
>>> + * @childobj: A pointer to the memory to be used for the object.
>>> + * @size: The maximum size available at @obj for the object.
>>> + * @type: The name of the type of the object to instantiate.
>>> + * @errp: If an error occurs, a pointer to an area to store the area
>>> + *
>>> + * This function will initialize an object. The memory for the object should
>>> + * have already been allocated. The object will then be added as child property
>>> + * to a parent with object_property_add_child() function. The returned object
>>> + * has a reference count of 1, and will be finalized when the last reference is
>>> + * dropped.
>>> + */
>>> +void object_initialize_as_child(Object *parentobj, const char *propname,
>>> +                                void *childobj, size_t size, const char *type,
>>> +                                Error **errp);
>>
>> Why did you use void* instead of Object*?
>
> That's the same what object_initialize() is doing (see above). Otherwise
> all the callers have to cast their pointers with OBJECT() first.

Casting with OBJECT() would not work, because it does a typecheck.
At the point where something is calling object_initialize() or
object_initialize_with_child(), the memory at 'childobj' has not
been initialized, so a typecheck is impossible.

It's only once the object has actually been initialized that
the memory is a valid Object* that you can put through OBJECT().

thanks
-- PMM
