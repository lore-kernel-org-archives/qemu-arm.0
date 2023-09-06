Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2708887ejb;
        Wed, 6 Sep 2023 05:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYE9wIsF7EAQTwgEnLRt1KxwdUCru3ctLh54C5QZlFPDTtsHXtds20NBMo/byUWI9KHFb0
X-Received: by 2002:a0c:f092:0:b0:630:7d0:56f4 with SMTP id g18-20020a0cf092000000b0063007d056f4mr16508701qvk.49.1694002914983;
        Wed, 06 Sep 2023 05:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694002914; cv=none;
        d=google.com; s=arc-20160816;
        b=sHOwYqDW1MvGkit59TS0gHacm/fj6XQ5KashJ0NyvX9NDEN2k4uqSdzLvCqc9MxjbB
         6cViMIlmi8F7Gl1WGoIztC/ZxCbuwGHLPu7vxHZVPevVNyYfurW/ULISxQ8MjxZFobbL
         i8iIgCQouh1TW5fhuaUVewyJvQ+VoTml1ZlsGp4xfYkC7Z5Zf7lMLHrYzM7bGGOswuAP
         QbGsRuLGBb2iXtbvwef8EaVSyq6psoOxW5Qcg/UvFQ0SUUqZBA35fB/sH3GIwGaY5AHF
         tCvyLxublosSQTo27T+0eb+0+JjGd2BH7y3hw7zQswKcOgTAAiJTT+Ie6iFlsT4emyNE
         nQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=+CytsB6juh8g7Xr22j5hRl41ph4dCRv1SBoXaY1riwk=;
        fh=G7A6MFB/Oe13/wnjAO9brw7ai67ajpDuRzX1Nu9ZiNg=;
        b=z9dl44k5Zd4+pCIZCG4iBCi3GZvDh50sjDuCISsVLfAvZkYlXn6JWkO/HXSCyhNRAw
         ZBjaOwkzIeF0eBGSK2Ba3+g7XshauRIMdpOfSHkE+FH2I/U5ibgmOItHu2uaJa60ydmB
         8hBHOawsIQwYr4hT3JMWBZA2Qk/wLS4n0PLxaMJPP5L2ww1uPQkgmvq0bgmrhU1QUd/B
         JXpvjrjD00QN8cbpQk1y6A3N94CGydGF8zsFAirN7YWwSXsPswrq+NPybvrHkEKYTqC9
         Z/j1qZj5RuQsC4NSkpA3ZDzS75sHrkjg27UdfLMY6Ez9W05VP+lLdnjQFgwKJht3yLnc
         8pYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NTpYqhH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a0cf34d000000b006515d9db094si9975965qvm.487.2023.09.06.05.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 05:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NTpYqhH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdrX6-0001qv-R4; Wed, 06 Sep 2023 08:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdrX5-0001oh-6F
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 08:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qdrX0-0002Ad-Rq
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 08:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694002873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CytsB6juh8g7Xr22j5hRl41ph4dCRv1SBoXaY1riwk=;
 b=NTpYqhH4BbkPPpP/RjygVM40lbgOK/2HEw4e004fh+JpS65ekVMmZmFjEYoFsq07zjtcB6
 rNfFgvACm/evtYaCerqqlGRvG4LX3Gt2dOLfY2Hc2vnrgVWe7FTtKrcgM+TIpximJcHFUe
 DQSOJkUR8laNV4nOiSx/vKZd2kWMNSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-BfC1JyuGNHeO_6arSV-HyQ-1; Wed, 06 Sep 2023 08:21:10 -0400
X-MC-Unique: BfC1JyuGNHeO_6arSV-HyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D791D1052171;
 Wed,  6 Sep 2023 12:21:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F0340C2070;
 Wed,  6 Sep 2023 12:21:05 +0000 (UTC)
Date: Wed, 6 Sep 2023 13:21:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: William Tsai <williamtsai1111@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Fam Zheng <fam@euphon.net>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2] qdict: Preserve order for iterating qdict elements
Message-ID: <ZPhurxruVwgfh46h@redhat.com>
References: <20230902094041.8626-1-williamtsai1111@gmail.com>
 <ZPYIBVtUgDGhj3TQ@redhat.com>
 <c9ab7061-22da-fed5-97bf-4924fe07cbf8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ab7061-22da-fed5-97bf-4924fe07cbf8@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jb39nTwF7W6V

On Wed, Sep 06, 2023 at 12:25:30PM +0200, David Hildenbrand wrote:
> On 04.09.23 18:38, Daniel P. Berrangé wrote:
> > On Sat, Sep 02, 2023 at 05:40:40PM +0800, William Tsai wrote:
> > > Changing the structure of qdict so that it can preserve order when
> > > iterating qdict. This will fix array_properties as it relies on `len-`
> > > prefixed argument to be set first.
> > > 
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1090
> > > Signed-off-by: William Tsai <williamtsai1111@gmail.com>
> > 
> > This is a variation of what Markus illustrated a year ago
> > 
> >    https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html
> > 
> > I wasn't a particular fan of that approach at the time.
> > 
> > I've made an alternative proposal here which avoids the broader
> > impact of this QDict change:
> > 
> >    https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg00652.html
> 
> Just a note regarding s390x CPU models (and how they are also affected, but
> it probably doesn't matter because it never 100% worked that way on all interfaces).

Oh, that's interesting to see a ordering scenario that isn't related
to the PROP_ARRAY stuff we already identified.

> I recall that I thought the order of parameters worked for s390x CPU models,
> where we support feature groups (due to the huge number of CPU features). But this
> might only have worked for the "-cpu" parameter, which parses them in-order and
> sets properties in-order.
> 
> So when mixing a feature group with contained features, the end result might not
> be deterministic in other cases thatn "-pu" (CPU hotplug via "-device", but
> also qapi CPU model operations).
> 
> For example, one might want to enable all but some features of a group, or
> disable all but some features of a group. Note that I doubt that there are really
> users of that, but it's possible on the QEMU cmdline.
> 
> I guess it never really worked with qapi CPU model operations in general
> (baseline, comparison, expansion, ...) because these
> operations all rely on qdict as well (see cpu_model_from_info()). So they should
> never return something non-deterministic.
> 
> 
> To highlight one case that could now fail:
> 
> $ ./qemu-system-s390x -smp 1,maxcpus=2 -cpu qemu,msa2=off,kimd-sha-512=on -nographic -nodefaults -monitor stdio -S -device qemu-s390x-cpu,core-id=1,msa2=off,kimd-sha-512=on
> QEMU 8.1.50 monitor - type 'help' for more information
> qemu-system-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
> qemu-system-s390x: -device qemu-s390x-cpu,core-id=1,msa2=off,kimd-sha-512=on: warning: 'msa5-base' requires 'kimd-sha-512'.
> qemu-system-s390x: -device qemu-s390x-cpu,core-id=1,msa2=off,kimd-sha-512=on: warning: 'msa5-base' requires 'klmd-sha-512'.
> qemu-system-s390x: -device qemu-s390x-cpu,core-id=1,msa2=off,kimd-sha-512=on: Mixed CPU models are not supported on s390x.
> 
> Note that using "-device qemu-s390x-cpu,core-id=1" instead works as expected, as
> cpu_common_parse_features() registers all settings as global properties for
> that CPU type.
> 
> 
> Further, feature groups might not be used by actual users that way. CPU model expansion (s390_feat_bitmap_to_ascii()) only reports a feature group when all
> features are contained, so most of libvirt should be fine, unless someone decides to
> manually specify a non-deterministic CPU model as above.
> 
> So maybe one can conclude that specifying "msa2=off,kimd-sha-512=on" is similar to
> "kimd-sha-512=off,kimd-sha-512=on", and which setting "wins" is not deterministic.

Right now you can have arbitrary ordering of CPU feature groups and
individual features, with both on/off. Historically you could even have
the same feature name repeated with different on/off values and the last
occurrance would "win". This is incredibly flexible, but I think we could
argue this level of flexibility is overkill in practice for 99% of QEMU
deployments.

If we were to define two semantic rules for CPU specification:

  * All feature groups are processed before individiual features
  * A given feature group name or individual feature name may
    only appear once.

That would allow you to provide an implementation whose semantics
are not sensitive to the ordering of parameters, while still keeping
sufficient flexibility for all typical real world use cases.

The only thing I see lacking here is that it prevents users from doing
a "quick hack" of blindly appending  "foo=off" to an existing -cpu
argument - they would have to first check if 'foo' already appeared
in the existing -cpu arg and modify it in place. IMHO that's an
acceptable loss

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

