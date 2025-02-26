Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp758155njg;
        Wed, 26 Feb 2025 00:31:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXfF/E46vr0b7yjN6bCgtjpd/BPOiCbFaCc2hH60Sni1ZPLvHck8kQiANe+wNBeGcHyaYBrU5dXy9/tg==@linaro.org
X-Google-Smtp-Source: AGHT+IEKD6FMbFXqjsbr/SJ0k9qL5iH84vkS/niQCg42aPFJb3lTzp13LGwbztCk7O/fvNQke0VH
X-Received: by 2002:a05:622a:652:b0:471:eca0:1137 with SMTP id d75a77b69052e-4737722a71cmr93402091cf.30.1740558678647;
        Wed, 26 Feb 2025 00:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740558678; cv=none;
        d=google.com; s=arc-20240605;
        b=HwlfnYXABDG1YcMfwjlLsuV/3rYh2X1CyiZ3KzTEXN5PeEoRcCXgXkM32S+1kD2IqZ
         5WT9vK6iC0nkHBfSLWcnjZe66HvnejV4s3SdfQSugVvaPLaPFDWOHNvW/S0i0KJSQTX3
         4TycWxR/KvTjVD4iNsGLyfJdA/dEMmiaUYm5RfRYfrCt5+jS5Rr+nSsbxwFtmRFgy+Fb
         2IFpmVcI463K5Jd+bRrP8R51iQTmsZYXBV7qP1G3OQlnUzdtsPmfF+4F8pMz6LG6/DIL
         ndbiFpU6aa5Z/Qww8F89DfUqvsM/8L6VfKBy12cKGgRAIRsxwS0wQGxNMktzJMzbsGEH
         0uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=ww3uKG8CmEWGXYyCLwQpcH4TmaP/mcFJg7JrSu50wKY=;
        fh=EbqKIRY0NKJCmiEA6itck7rE78l+4xj0ZHpXOhM4vho=;
        b=UinHfnQKKzxFQCEuEuBuNTnTQzGebCr4Q6Y7u9OxaZB9wHkE25ox56f71armTy+kqX
         0dKR2s8fZolPNxOrGmzzAHNXnpHh6zAxWOWn7PO13B4wFQQ2r2eBZnWeBEE8CwprC2yQ
         UOalk1D5Pd8yQ8SutFM8rRJdaLyVjNxZ1SdkcXeSMyOuXso3r/DgwI/XB4//HJmRb+fr
         jFDiFQ5Kfh86Qha6MwW+in/oKq2nD2pdQYYINHwRwqIgVIvtTcKtwFkMcf1QmlWHJ5Dg
         xl3y3GZbbFfbVjmHDTR8Jhs+jPeCVPjWQx5GhAoBFL6atIblmL7Vflw3e4zTE9ePeeyn
         5d3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FatntdD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47378095836si33290791cf.408.2025.02.26.00.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 00:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FatntdD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnCoQ-00022Y-80; Wed, 26 Feb 2025 03:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tnCoO-00022C-BD
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 03:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tnCoK-0004MM-Is
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 03:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740558631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ww3uKG8CmEWGXYyCLwQpcH4TmaP/mcFJg7JrSu50wKY=;
 b=FatntdD1a7wlSH6dPilsHc1Mkqpcyori572HCw14hC6uRSJC2xfVObdAmYGYPTrnJYOoQV
 SnfPtNDNOBja2r580gxlcq1IobuH/5gZixfatwhCmRHOMmtylqhsNyuexb/usO0HQ+f3Vi
 JUw6qxxqSbQCpJxeCUSy7ebXCPVVw1g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-tzyb_C32P1ODdgAm12C2aw-1; Wed,
 26 Feb 2025 03:30:26 -0500
X-MC-Unique: tzyb_C32P1ODdgAm12C2aw-1
X-Mimecast-MFC-AGG-ID: tzyb_C32P1ODdgAm12C2aw_1740558624
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E5C018E6952; Wed, 26 Feb 2025 08:30:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9C6501800357; Wed, 26 Feb 2025 08:30:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E5BE21E66B9; Wed, 26 Feb 2025 09:30:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,  qemu-arm@nongnu.org,  Ard
 Biesheuvel <ardb@kernel.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 graf@amazon.com,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v5 14/24] hw/uefi: add var-service-json.c + qapi for NV
 vars.
In-Reply-To: <wyrnw2ur2xp7e6yr7f7hdbn3zbvolnvjojjrlaoax7hb2psxzo@xw7arzdtroer>
 (Gerd Hoffmann's message of "Wed, 26 Feb 2025 08:47:57 +0100")
References: <20250225163031.1409078-1-kraxel@redhat.com>
 <20250225163031.1409078-15-kraxel@redhat.com>
 <87zfi95khl.fsf@pond.sub.org>
 <wyrnw2ur2xp7e6yr7f7hdbn3zbvolnvjojjrlaoax7hb2psxzo@xw7arzdtroer>
Date: Wed, 26 Feb 2025 09:30:21 +0100
Message-ID: <87bjup3y76.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YJWsbjAoCysK

Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> > +# @data: variable value, encoded as hex string.
>> 
>> I understand this is a blob.  We commonly use base64 for that.  Why not
>> here?
>
> It's an existing format already supported by other tools.

Having a second format for blobs is unfortunate.

I can't judge whether the convenience of sharing the format with other
tools is worth the additional interface complexity and code.  It could
be if it avoids having to re-encode from hex to base64 in multiple
places.

Got to trust your judgement here.

>                                                            Guess I
> should add that to the preamble.

Commit messages are usually a good home for rationale.

>> > +# @digest: variable certificate digest.  Used to verify the signature
>> > +#     of updates for authenticated variables.
>> 
>> How to create and verify these digests will be obvious enough to users
>> of this interface?
>
> Well, no.  It's a somewhat complicated story ...
>
> UEFI has two kinds of authenticated variables.  First, the secure boot
> variables (PK, KEK, db, dbx).  These have hard-coded rules, the rule
> most relevant in practice is that signed update requests for the 'db'
> and 'dbx' variables are checked against the 'KEK' certificate database.
>
> For other authenticated variables UEFI essentially remembers the
> certificate when the variable is created, and any update / delete
> requests need a signature from the same certificate (simplified a
> bit to keep it short, the actual rules are more complicated, details
> are in the UEFI spec).
>
> This digest handles the "remembers the certificate" part.
>
> In practice the second kind of authenticated variables is rarely used.
> I have yet to see a piece of software actually using that in practice
> (other than the test case I have written).
>
>
> Also note that this is *not* part of the QMP interface.  The driver uses
> this to store the efi variable store in json format on disk (see
> var-service-json.c in this patch).
>
> Adding support for reading/writing uefi variables is something we might
> add to the monitor in the future.   Should that happen it is not clear
> whenever such an interface would actually use the raw 'UefiVariable'
> struct or if higher-level interfaces would be more useful.  For example
> a command to query whenever the guest has secure boot turned on.

I wonder how much of this, if anything, should be worked into the doc
comment.  You decide :)

With the typo I pointed out fixed:
Acked-by: Markus Armbruster <armbru@redhat.com>

