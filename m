Received: by 10.25.21.96 with SMTP id l93csp102513lfi;
        Tue, 14 Jun 2016 07:13:01 -0700 (PDT)
X-Received: by 10.55.160.132 with SMTP id j126mr19900729qke.108.1465913581773;
        Tue, 14 Jun 2016 07:13:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si18469200qkh.172.2016.06.14.07.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 07:13:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCp5R-00021d-3N
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 10:13:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bCp0c-0006Kw-Gh
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 10:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bCp0W-0006Ck-Rw
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 10:08:01 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:49800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1bCp0W-0006CY-J0; Tue, 14 Jun 2016 10:07:56 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 893A1F6A80D4A;
	Tue, 14 Jun 2016 15:07:48 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 14 Jun 2016 15:07:51 +0100
Date: Tue, 14 Jun 2016 15:07:45 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <20160614140745.GA13260@hhmipssw201.hh.imgtec.org>
References: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1465552668-30084-2-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1465552668-30084-2-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v9 01/10] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	agraf@suse.de, blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	miodrag.dinic@imgtec.com, maciej.rozycki@imgtec.com,
	qemu-ppc@nongnu.org, petar.jovanovic@imgtec.com,
	qemu-arm@nongnu.org, aleksandar.markovic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, aurelien@aurel32.net,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vulzv/+6NPRY

On Fri, Jun 10, 2016 at 11:57:28AM +0200, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> This patch modifies SoftFloat library so that it can be configured in
> run-time in relation to the meaning of signaling NaN bit, while, at the
> same time, strictly preserving its behavior on all existing platforms.
> 
> Background:
> 
> In floating-point calculations, there is a need for denoting undefined or
> unrepresentable values. This is achieved by defining certain floating-point
> numerical values to be NaNs (which stands for "not a number"). For additional
> reasons, virtually all modern floating-point unit implementations use two
> kinds of NaNs: quiet and signaling. The binary representations of these two
> kinds of NaNs, as a rule, differ only in one bit (that bit is, traditionally,
> the first bit of mantissa).
> 
> Up to 2008, standards for floating-point did not specify all details about
> binary representation of NaNs. More specifically, the meaning of the bit
> that is used for distinguishing between signaling and quiet NaNs was not
> strictly prescribed. (IEEE 754-2008 was the first floating-point standard
> that defined that meaning clearly, see [1], p. 35) As a result, different
> platforms took different approaches, and that presented considerable
> challenge for multi-platform emulators like QEMU.
> 
> Mips platform represents the most complex case among QEMU-supported
> platforms regarding signaling NaN bit. Up to the Release 6 of Mips
> architecture, "1" in signaling NaN bit denoted signaling NaN, which is
> opposite to IEEE 754-2008 standard. From Release 6 on, Mips architecture
> adopted IEEE standard prescription, and "0" denotes signaling NaN. On top of
> that, Mips architecture for SIMD (also known as MSA, or vector instructions)
> also specifies signaling bit in accordance to IEEE standard. MSA unit can be
> implemented with both pre-Release 6 and Release 6 main processor units.
> 
> QEMU uses SoftFloat library to implement various floating-point-related
> instructions on all platforms. The current QEMU implementation allows for
> defining meaning of signaling NaN bit during build time, and is implemented
> via preprocessor macro called SNAN_BIT_IS_ONE.
> 
> On the other hand, the change in this patch enables SoftFloat library to be
> configured in run-time. This configuration is meant to occur during CPU
> initialization, at the moment when it is definitely known what desired
> behavior for particular CPU (or any additional FPUs) is.
> 
> The change is implemented so that it is consistent with existing
> implementation of similar cases. This means that structure float_status is
> used for passing the information about desired signaling NaN bit on each
> invocation of SoftFloat functions. The additional field in float_status is
> called snan_bit_is_one, which supersedes macro SNAN_BIT_IS_ONE.
> 
> IMPORTANT:
> 
> This change is not meant to create any change in emulator behavior or
> functionality on any platform. It just provides the means for SoftFloat
> library to be used in a more flexible way - in other words, it will just
> prepare SoftFloat library for usage related to Mips platform and its
> specifics regarding signaling bit meaning, which is done in some of
> subsequent patches from this series.
> 
> Further break down of changes:
> 
>   1) Added field snan_bit_is_one to the structure float_status, and
>      correspondent setter function set_snan_bit_is_one().
> 
>   2) Constants <float16|float32|float64|floatx80|float128>_default_nan
>      (used both internally and externally) converted to functions
>      <float16|float32|float64|floatx80|float128>_default_nan(float_status*).
>      This is necessary since they are dependent on signaling bit meaning.
>      At the same time, for the sake of code cleanup and simplicity, constants
>      <floatx80|float128>_default_nan_<low|high> (used only internally within
>      SoftFloat library) are removed, as not needed.
> 
>   3) Added a float_status* argument to SoftFloat library functions
>      XXX_is_quiet_nan(XXX a_), XXX_is_signaling_nan(XXX a_),
>      XXX_maybe_silence_nan(XXX a_). This argument must be present in
>      order to enable correct invocation of new version of functions
>      XXX_default_nan(). (XXX is <float16|float32|float64|floatx80|float128>
>      here)
> 
>   4) Updated code for all platforms to reflect changes in SoftFloat library.
>      This change is twofolds: it includes modifications of SoftFloat library
>      functions invocations, and an addition of invocation of function
>      set_snan_bit_is_one() during CPU initialization, with arguments that
>      are appropriate for each particular platform. It was established that
>      all platforms zero their main CPU data structures, so snan_bit_is_one(0)
>      in appropriate places is not added, as it is not needed.
> 
> [1] "IEEE Standard for Floating-Point Arithmetic",
>     IEEE Computer Society, August 29, 2008.
> 
> Tested-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de> (TriCore part)
> Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
> Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>  fpu/softfloat-specialize.h    | 535 ++++++++++++++++++++----------------------
>  fpu/softfloat.c               | 172 ++++++--------
>  include/fpu/softfloat.h       |  45 ++--
>  target-arm/helper-a64.c       |  14 +-
>  target-arm/helper.c           |  40 ++--
>  target-m68k/helper.c          |   6 +-
>  target-microblaze/op_helper.c |   6 +-
>  target-mips/cpu.h             |   5 +
>  target-mips/helper.h          |   4 +-
>  target-mips/msa_helper.c      |  88 +++----
>  target-mips/op_helper.c       |  17 +-
>  target-mips/translate.c       |   5 +-
>  target-mips/translate_init.c  |   2 +
>  target-ppc/fpu_helper.c       | 120 +++++-----
>  target-s390x/fpu_helper.c     |  28 ++-
>  target-s390x/helper.h         |   6 +-
>  target-s390x/translate.c      |   6 +-
>  target-sh4/cpu.c              |   1 +
>  target-unicore32/cpu.c        |   2 +
>  19 files changed, 547 insertions(+), 555 deletions(-)

Looks good to me (plus I ran my regression tests for MIPS):

Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
Tested-by: Leon Alrae <leon.alrae@imgtec.com>

Thanks,
Leon
