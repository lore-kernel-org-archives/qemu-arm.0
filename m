Received: by 10.80.166.35 with SMTP id d32csp1198207edc;
        Fri, 28 Oct 2016 07:22:14 -0700 (PDT)
X-Received: by 10.55.184.2 with SMTP id i2mr12831170qkf.196.1477664534410;
        Fri, 28 Oct 2016 07:22:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s59si8545833qtd.74.2016.10.28.07.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 07:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c082v-0007pl-56
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 10:22:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1c082e-0007gt-Iq
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 10:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1c082a-0005OL-GN
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 10:21:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1c082a-0005Nv-7y; Fri, 28 Oct 2016 10:21:52 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 576D47AE9B;
	Fri, 28 Oct 2016 14:21:51 +0000 (UTC)
Received: from localhost (vpn1-4-123.pek2.redhat.com [10.72.4.123])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9SELntU022944; Fri, 28 Oct 2016 10:21:50 -0400
Date: Fri, 28 Oct 2016 22:21:49 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20161028142149.GD8431@lemon>
References: <1477596278-1470-1-git-send-email-ppandit@redhat.com>
	<147766342608.143.15390303781959856001@9040ca97f87d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <147766342608.143.15390303781959856001@9040ca97f87d>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 28 Oct 2016 14:21:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] char: cadence: check baud
 rate generator and divider values
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
Cc: peter.maydell@linaro.org, pjp@fedoraproject.org,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	ppandit@redhat.com, psirt@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Cu9JrJG0o3l

On Fri, 10/28 07:03, no-reply@patchew.org wrote:
> In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/lib/glib-2.0/include/glibconfig.h:9:0,
>                  from /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib/gtypes.h:32,
>                  from /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib/galloca.h:32,
>                  from /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib.h:30,
>                  from /tmp/qemu-test/src/include/glib-compat.h:19,
>                  from /tmp/qemu-test/src/include/qemu/osdep.h:107,
>                  from trace/generated-tracers.c:3:
> trace/generated-tracers.c: In function '_simple_trace_visit_type_str':
> trace/generated-tracers.c:50123:42: error: passing argument 1 of 'strlen' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      size_t argobj_len = obj ? MIN(strlen(obj), MAX_TRACE_STRLEN) : 0;
>                                           ^
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib/gmacros.h:291:23: note: in definition of macro 'MIN'
>  #define MIN(a, b)  (((a) < (b)) ? (a) : (b))
>                        ^
> In file included from /tmp/qemu-test/src/include/qemu/osdep.h:69:0,
>                  from trace/generated-tracers.c:3:
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/string.h:55:18: note: expected 'const char *' but argument is of type 'char **'
>    size_t __cdecl strlen(const char *_Str);
>                   ^~~~~~
> In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/lib/glib-2.0/include/glibconfig.h:9:0,
>                  from /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib/gtypes.h:32,
>                  from /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib/galloca.h:32,
>                  from /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib.h:30,
>                  from /tmp/qemu-test/src/include/glib-compat.h:19,
>                  from /tmp/qemu-test/src/include/qemu/osdep.h:107,
>                  from trace/generated-tracers.c:3:
> trace/generated-tracers.c:50123:42: error: passing argument 1 of 'strlen' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      size_t argobj_len = obj ? MIN(strlen(obj), MAX_TRACE_STRLEN) : 0;
>                                           ^
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/glib-2.0/glib/gmacros.h:291:36: note: in definition of macro 'MIN'
>  #define MIN(a, b)  (((a) < (b)) ? (a) : (b))
>                                     ^
> In file included from /tmp/qemu-test/src/include/qemu/osdep.h:69:0,
>                  from trace/generated-tracers.c:3:
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/string.h:55:18: note: expected 'const char *' but argument is of type 'char **'
>    size_t __cdecl strlen(const char *_Str);
>                   ^~~~~~
> trace/generated-tracers.c:50134:34: error: passing argument 2 of 'trace_record_write_str' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      trace_record_write_str(&rec, obj, argobj_len);
>                                   ^~~
> In file included from trace/generated-tracers.c:17892:0:
> /tmp/qemu-test/src/trace/simple.h:42:6: note: expected 'const char *' but argument is of type 'char **'
>  void trace_record_write_str(TraceBufferRecord *rec, const char *s, uint32_t slen);
>       ^~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> /tmp/qemu-test/src/rules.mak:60: recipe for target 'trace/generated-tracers.o' failed
> make: *** [trace/generated-tracers.o] Error 1
> make[1]: *** [docker-run] Error 2
> make[1]: Leaving directory `/var/tmp/patchew-tester-tmp-vo_8jsgn/src'
> make: *** [docker-run-test-mingw@fedora] Error 2
> === OUTPUT END ===

You can ignore this one, it's not in this patch and is just fixed on master -
the series was applied by patchew earlier than that.

Fam
