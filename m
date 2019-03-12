Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp546929wrs;
        Tue, 12 Mar 2019 07:20:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeOMLaxG841SfydXA4jvy6c0U4n0WZzvb6o9NovUfagL22NYoHlpsKksvs8g21tn1JEKjh
X-Received: by 2002:a0d:c483:: with SMTP id g125mr10569971ywd.386.1552400456317;
        Tue, 12 Mar 2019 07:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552400456; cv=none;
        d=google.com; s=arc-20160816;
        b=qRZaGh8GqMdNKaIOnrp19Iq/Xp+3rWpAZzdgkpoSP3bbI8L9hQx4S2sDX9T/a9DwRl
         SUgcNselUjPhf9DoHxw82ryJBYrKzHY+IiUxNHm/lPq60jGP19Zfuc6J1CVQsZDF3++A
         JiFqHx8J2V9UwVhk2W3OrSnNSjdai3wTWa427+pqgVn2XhRXRceFffcZAgXfmmZ6LcUc
         V4z3ImJfnMHv2azsFwUQ05VQboeelFXUK4oV3KFRF2z6Pa9TWtV4zYQSp+wLmbEL6Nut
         EmQbEm7pRBW4GWys6FfaPE104lXIY94WgPB7lifYVNUJTfUDIc2uzzbCfdUkVPNaMY0L
         YA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=w55caLjiJsmRn+TPjRkxdFIAcIMf3YqyZTro5JceqzY=;
        b=V7x1PsWa8WUTQn7dz+Gk7tCSL4eMWSuaC55ivAEwDJKQ04baIFObEsoyNWMMJja5sw
         8oyt82VuaDXAk/dpAV3a22A2qkX+r3lQG3soBA1JgdPLPzy4ltvtwl2igPdj2Y7RY1Uu
         ktbYs2Vn6KwgZthKrroex3UlQLhjqkzZ93xRSS/F+G9a0KmVwyB6Jxb/wNrI+YXZNjCB
         CWnYHs+jeXHOLCfQoTgRZwzJMkgn2sHFNQyZ7mBhLs4ZooeQTGPJj12MKvnKWzfL0b0L
         1Cld5NzeTqwbbUDB7ihLdLDETEZ8/P4Rd3znGwYAVYdCtKpY2ET90dPlIJBwvfId1Eyp
         wXlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j80si5013569ybj.307.2019.03.12.07.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 07:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3iH1-0004Og-Lb
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 10:20:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h3iEB-0002ap-36
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 10:17:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h3i8E-0006Lf-PN
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 10:11:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h3i8D-0006IC-Mi; Tue, 12 Mar 2019 10:11:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9AF8E6A77;
	Tue, 12 Mar 2019 14:05:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-59.rdu2.redhat.com
	[10.10.120.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC9DB1001E74;
	Tue, 12 Mar 2019 14:04:52 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-4-philmd@redhat.com>
	<71bce75b-a2a9-061b-a1c2-7c4e49d957b1@redhat.com>
	<87y35o3yq3.fsf@dusky.pond.sub.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b653ca06-e7c2-6daa-2f48-3dff7811074b@redhat.com>
Date: Tue, 12 Mar 2019 15:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87y35o3yq3.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 12 Mar 2019 14:05:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 03/18] cutils: Add qemu_strdup_hexlify()
 and qemu_strdup_unhexlify()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rx9inonReUiC

On 03/09/19 15:32, Markus Armbruster wrote:
> Laszlo Ersek <lersek@redhat.com> writes:

>> (5) Most importantly: I don't think we need this patch.
>>
>> First, AFAICS, the unhex function is never used in the series, and no
>> unit test is being added for it. That makes it a bad candidate for
>> "include/qemu/cutils.h".
>>
>> Second, while the hex function is used in PATCH v2 13/18
>> ("hw/nvram/fw_cfg: Add QMP 'info fw_cfg' command"), the documentation in
>> that patch and the logic in the patch are inconsistent. The
>> documentation -- i.e. both the commit message and the "misc.json" change
>> -- say that "FirmwareConfigurationItem.data" is unused (not populated).
>> However, that's exactly what create_qmp_fw_cfg_item() uses the hex
>> function for.
>>
>> Third, if we do decide that the QMP command should output the fw_cfg
>> binary data, then the QMP tradition (to my knowledge) has been to use
>> base64 encoding. GLib provides helpers for base64:
>>
>> https://developer.gnome.org/glib/stable/glib-Base64-Encoding.html
>>
>> and you can see examples of it being used in e.g.
>>
>> (a) qmp_ringbuf_read() [chardev/char-ringbuf.c] -- the  @ringbuf-read
>> command is defined in "qapi/char.json"
>>
>> (b) qmp_guest_exec_status() [qga/commands.c] -- the @guest-exec-status
>> command is defined in "qga/qapi-schema.json".
> 
> Yes.  I wish you had wrote that first, saving me the trouble of looking
> at the patch.
> 

You are right, I'm sorry! :(
Laszlo
