Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp18334ejr;
        Tue, 10 Oct 2023 03:10:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5CKBxuS8EMWU4pNSf1OrYy789cWy34CeFDQNlrobpnLbfVVi74/wkgT93ZVE5Vmeu+hb6
X-Received: by 2002:a05:6102:3d1a:b0:457:6858:af72 with SMTP id i26-20020a0561023d1a00b004576858af72mr7493508vsv.22.1696932628980;
        Tue, 10 Oct 2023 03:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696932628; cv=none;
        d=google.com; s=arc-20160816;
        b=qUjjY6j5zFSfUm448YSRAzP323MSCoApTvRVDAH0h3tBOo4oHWbjIur9UcIdyX0P2q
         xBaVML0VsHxWPwcssCVkrB4d45ooOCM7ccarIuruP/hyaej9ENJ5as/0xBmtA4daoZg7
         WTAO8AzVKhUJ1K3LRhnHV6XRM/XLE8QqS5pMNS7grGxHcLyLOQwi/ATnwYmLCuxcPdR2
         dMQSPSTIBjZDLxp4JajEOR+F9a9XMQFCjJb1N01ZS1MP8PLX7cymbVTmwLk0HtC6fhT9
         wVdepNjmbBBgSBamsMnRI3euQTKnkgKSs6BSCIs0rqh+6mdM7ZFMqE6fHNN3rMwi+LB3
         RfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=JYK0CQO/LOVSI69A9QSZD2Na+ty08FG/Z/mX+Fx+1ww=;
        fh=b7Qn9dBgXWOiwaKfBZ+RHpFOxF3L7+cB/URpWmVqc0k=;
        b=LKjmVxmmd1hrdz5SRGAqZlLKj4a5ozXyTHQ4TDDfKsubx1yA6BqRiMzIMVlrCYAZ12
         L3x+YlXqMclQxylFEAuqOlkQZUv5kGlRBb000eKIeX/U/3QE0c3k4NOvFSrGdSQLJklA
         84E0s1R6FqUfPBsJPev0B7JLBRAkMJ1Qk/59Kxqg7xFw6iWlBfNA1eYQNC/GZqkykhtl
         Zq3H/8xhrDjC/JltF5nABCFXI0VQQG7/M0AZJlqGCFh1q0/EZ3/wLwdIqsa3jpdBYZL+
         QtDFOtIVGVUF4RuMjRIZ/XonE1yot2TXXKE2pJlWD7cITUJKRcJpgmDyqBfpYfm+whrL
         kqfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hmyd700R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a0cdb04000000b0065d08f03195si7486733qvk.361.2023.10.10.03.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 03:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hmyd700R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq9gx-0002Lo-3B; Tue, 10 Oct 2023 06:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qq9go-0002F1-IF
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 06:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qq9gm-0008KH-11
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 06:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696932606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JYK0CQO/LOVSI69A9QSZD2Na+ty08FG/Z/mX+Fx+1ww=;
 b=hmyd700Rkb66z20RAipamyhfl0AhVzPsTupNOYpnK+XijFMhlBlgpUVP3c3Y343RIopbww
 egerG/y3Lkv2QDUaM+uCnu3hzAqr08loxUWUl6IM2RkhlN404y45FsJg8lj5PkuQsJQaq+
 5mfraWE4WnokMf1fP/YvNgz93V7j3D4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-C8mO9QFrOI6Wl7bGxvnHkQ-1; Tue, 10 Oct 2023 06:09:58 -0400
X-MC-Unique: C8mO9QFrOI6Wl7bGxvnHkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3357185A79C;
 Tue, 10 Oct 2023 10:09:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8BD492B16;
 Tue, 10 Oct 2023 10:09:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH for-8.2 2/2] arm/kvm: convert to kvm_get_one_reg
In-Reply-To: <875y6565ll.fsf@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy Ross"
References: <20230718111404.23479-1-cohuck@redhat.com>
 <20230718111404.23479-3-cohuck@redhat.com>
 <db578c20-22d9-3b76-63e7-d99b891f6d36@redhat.com>
 <878rb5g0f0.fsf@redhat.com>
 <4a990b57-800c-6799-8c23-4488069ffb76@redhat.com>
 <875y6565ll.fsf@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 10 Oct 2023 12:09:54 +0200
Message-ID: <87jzrubxfx.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: Bh0Wp3tZ0iym

[spooky season is coming up, so time for some thread necromancy!]

On Thu, Jul 27 2023, Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, Jul 25 2023, Gavin Shan <gshan@redhat.com> wrote:
>
>> On 7/24/23 18:48, Cornelia Huck wrote:
>>> On Mon, Jul 24 2023, Gavin Shan <gshan@redhat.com> wrote:
>>>>
>>>> On 7/18/23 21:14, Cornelia Huck wrote:
>>>>> We can neaten the code by switching the callers that work on a
>>>>> CPUstate to the kvm_get_one_reg function.
>>>>>
>>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>>> ---
>>>>>    target/arm/kvm.c   | 15 +++---------
>>>>>    target/arm/kvm64.c | 57 ++++++++++++----------------------------------
>>>>>    2 files changed, 18 insertions(+), 54 deletions(-)
>>>>>
>>>>
>>>> The replacements look good to me. However, I guess it's worty to apply
>>>> the same replacements for target/arm/kvm64.c since we're here?
>>>>
>>>> [gshan@gshan arm]$ pwd
>>>> /home/gshan/sandbox/q/target/arm
>>>> [gshan@gshan arm]$ git grep KVM_GET_ONE_REG
>>>> kvm64.c:    err = ioctl(fd, KVM_GET_ONE_REG, &idreg);
>>>> kvm64.c:    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
>>>> kvm64.c:        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
>>> 
>>> These are the callers that don't work on a CPUState (all in initial
>>> feature discovery IIRC), so they need to stay that way.
>>> 
>>
>> Right, All these ioctl commands are issued when CPUState isn't around. However, there
>> are two wrappers read_sys_{reg32, reg64}(). The ioctl call in kvm_arm_sve_get_vls()
>> can be replaced by read_sys_reg64(). I guess it'd better to do this in a separate
>> patch if you agree.
>
> Yes, we could do that, but I'm not sure how much it adds to the
> code... in any case, I agree that this would be a separate patch.

This series has managed to bubble up to the top of my todo list again,
and I think I'll just go ahead and include that as a separate change on
top.

