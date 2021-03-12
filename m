Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1050793lfg;
        Fri, 12 Mar 2021 01:20:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZgh2WHGahTwcTSM3Y1Z/OE/6Gs8tLsVWA5TqC4AdLsPFI4vUs8FW1lDM3N+uKVmYlra5i
X-Received: by 2002:a05:6902:102d:: with SMTP id x13mr16640881ybt.264.1615540832585;
        Fri, 12 Mar 2021 01:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615540832; cv=none;
        d=google.com; s=arc-20160816;
        b=IZOzgzyABewNZR0z/RxFDtQye6e/B0sBtl8N37+BAhC4d8KeR69hEbubU+9mJj22iS
         PjiIJTrAiGpsepjXH/DSsEV/ZhcQPsn4l4q1uz0QAOexAfs4ArzTfCQhqo8Ekc7hWxAo
         T9+5u5yJOafPFUBMJoV+kLEBIKKFBeeEFtSE2srhRIfsc0i3F1xgQES3bI+jq7YjghDO
         FN8KBFgDATDew41ou1l3ZEoDpsN3fVkip5+6sfDsA8OEG3/3OmQXvYslieNreNpUTzJN
         7MEeYPYLWyis2dSrd8M+90NjfWKqHBxTLsvzxYg3EnEKTtYNvjyce4VVkfRbjukfOAbd
         grPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=WY85PheJGUIWF/pnhP6dVvDiD4HcfYM0EzZHn/3af1Q=;
        b=iBnRdKGNJEsnjUdc1rBbTwaDSUHt6S/0htdi9PEYiVoA6wy8rGITxNU6Z9aDtgDZ9H
         jG9Fx8nZlJQfo4SdWKmhTmLsUhGS51O6eHlhK5UfANZDnxEtMDGoeAfN78JVc85fESa0
         wP62WMtckXgANISHgq3Rf87RXpODcrWEWPJnoUn+tzbj7wERq5T9u2esPBYzMY7Y8bD8
         XMDt46xeVBBFg6wLCBhAqwYlZAgTpcK6w8dMnraNYkDv1Y4zggXBcO6Uha2uEuhrfhCJ
         +MfJThxUeclPYo8aoNCfh4smH+m/tw6S6ucS+OT0EZtPLJ9gYdy8XHriGcki81hG0xhl
         q6eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NBN+c/3D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si5385982ybs.283.2021.03.12.01.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 01:20:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NBN+c/3D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKdyB-0005GR-S0
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 04:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdnS-0001Ru-QS
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdnQ-0004ag-4s
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WY85PheJGUIWF/pnhP6dVvDiD4HcfYM0EzZHn/3af1Q=;
 b=NBN+c/3Drp7xCzpZZdUVDC/+sMR+xLDbnEapvrRRVPMsxSMqVL5Assfc9gBxi2pUX31fW0
 mxbZlgPQT18Ca6Wih6VEljOrd0nfTQDLPC07bakSKhh++HP4NRkesCum4DE1uZKJ363pV1
 M+kYA1Z8Zhz4thDf2JYQ/RK0bpRBFEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-MPHRuJuRNoS4oePmyF4Xog-1; Fri, 12 Mar 2021 04:09:16 -0500
X-MC-Unique: MPHRuJuRNoS4oePmyF4Xog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E04683DD20;
 Fri, 12 Mar 2021 09:09:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF862648A8;
 Fri, 12 Mar 2021 09:09:03 +0000 (UTC)
Date: Fri, 12 Mar 2021 10:09:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <20210312090900.yadfwhwoa34pdluk@kamzik.brq.redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
 <b8bb7ced-36dd-aaf7-34bf-33d276f03bff@suse.de>
MIME-Version: 1.0
In-Reply-To: <b8bb7ced-36dd-aaf7-34bf-33d276f03bff@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hx3lvIz2shhV

On Fri, Mar 12, 2021 at 09:52:33AM +0100, Claudio Fontana wrote:
> On 3/12/21 9:48 AM, Andrew Jones wrote:
> > On Fri, Mar 12, 2021 at 09:11:45AM +0100, Thomas Huth wrote:
> >> On 12/03/2021 08.42, Marc-André Lureau wrote:
> >>>
> >>>
> >>> On Fri, Mar 12, 2021 at 3:14 AM Philippe Mathieu-Daudé
> >>> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> >>>
> >> [...]
> >>>     +##
> >>>     +# @AcceleratorInfo:
> >>>     +#
> >>>     +# Accelerator information.
> >>>     +#
> >>>     +# @name: The accelerator name.
> >>>     +#
> >>>     +# Since: 6.0
> >>>     +##
> >>>     +{ 'union': 'AcceleratorInfo',
> >>>     +  'base': {'name': 'Accelerator'},
> >>>     +  'discriminator': 'name',
> >>>     +  'data': { } }
> >>>
> >>>     +
> >>>
> >>>
> >>> Making room for future details, why not.
> >>
> >> I think we definitely need the additional data section here: For KVM on
> >> POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
> >> MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
> >> for KVM on x86 whether it's the AMD flavor or Intel, ...
> > 
> > Could also pre-expand all of these and list them individually.
> 
> 
> 
> Let us consider simplicity for the reader, and which use cases we expect for this.

What do you mean by "reader"? If you mean the QMP client that needs this
information, then I can't think of anything more simple than a single list
of booleans with descriptive names to process. If you mean that the
expected use cases don't care about all those variants, then you don't
need to worry about that. Only the ones compiled in will be in the list.
The expected use cases will never see the other ones.

Thanks,
drew

